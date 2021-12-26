import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hakerkernel_taskflutter/model/PhotosModel.dart';
import 'package:hakerkernel_taskflutter/model/PostModel.dart';
import 'package:hakerkernel_taskflutter/model/UserModel.dart';
import 'package:hakerkernel_taskflutter/screens/MyHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'ServerDetails.dart';
import 'dart:convert' as convert;
import 'dart:convert';

class WebServices {

  static Future<void> loginRequest(String email, String password, BuildContext context) async {
    var request = {};

    request["email"] = email;
    request["password"] = password;

    print(request);
    var response = await http.post(Uri.parse(ServerDetails.login),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });
    print(response.body);


    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    print(jsonResponse);
    if (email.isEmpty || email == null || email == "" || password.isEmpty ||
        password == null || password == "") {
      Fluttertoast.showToast(msg: ' email can\'t be empty');
    }


    else if (response.statusCode == 200) {
      print("token  ${jsonResponse['token']}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("login", true);
      prefs.setString("email", email);
      prefs.setString("token", jsonResponse['token']);
      print("Success");
      UserdModel userModel = new UserdModel.fromJson(jsonResponse);
      print("token2 ${userModel.token}");


      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MyHomePage(title: "Home")));
    } else {
      //  Navigator.pop(context);
      Fluttertoast.showToast(msg: "unable to login");
      print("unable to login");
    }

    return;
  }

  static List<PostModel> getpostdata(String data) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  }


  static Future<List<PostModel>> fetchpostRequest() async {
    final response = await http.get(Uri.parse(ServerDetails.posts));
    print(response.body);
    if (response.statusCode == 200) {
      print("response${response.body}");
      return getpostdata(response.body);
    } else {
      throw Exception('error');
    }
  }
  static List<PhotosModel> getphdata(String data) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    print("parsed${parsed}");
    return parsed.map<PhotosModel>((json) => PhotosModel.fromJson(json)).toList();

  }


  static Future<List<PhotosModel>> fetchph() async {
   // Fluttertoast.showToast(msg: "hello");
    final response = await http.get(Uri.parse(ServerDetails.photos));
    print(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "response${response.body}");
      print("response${response.body}");
      return getphdata(response.body);
    } else {
      Fluttertoast.showToast(msg: "error");
      throw Exception('error');
    }
  }

  // static List<PhotosModel> getphotodata(String data) {
  //   final parsed = json.decode(data).cast<Map<String, dynamic>>();
  //   return parsed.map<PhotosModel>((json) => PhotosModel.fromJson(json)).toList();
  // }
  //
  // static Future<List<PhotosModel>> getphotosRequest() async {
  //   final response = await http.get(Uri.parse(ServerDetails.photos));
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     print("response${response.body}");
  //     return getphotodata(response.body);
  //   } else {
  //     throw Exception('error');
  //   }
  // }
}