import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';
import 'MyHomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool load = false;
  bool login = false;
  String email ="";
  SharedPreferences? preferences;
  bool check = false;
  @override
  void initState() {
    super.initState();

    _checkIfLoggedIn();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator()),
      ),

    );
  }
  void _checkIfLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     login = preferences.getBool("login") == null? false: preferences.getBool("login")!;
     email = preferences.getString("email") == null ? "@gmail.com" :preferences.getString("email")!;
    var token = preferences.getString("token");
    print("user${token}");
    print("emai${email}");
  // Fluttertoast.showToast(msg: "${check}");
    print("${login}");

    _navigatetologin();
  }

  void _navigatetologin() async{

    await Future.delayed(Duration(milliseconds: 3),(){});
    if(login){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MyHomePage(title: "Home")));
    }
    else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
    }

  }
}
