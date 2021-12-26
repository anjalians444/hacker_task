import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hakerkernel_taskflutter/constanse/color.dart';
import 'package:hakerkernel_taskflutter/constanse/sizedbox.dart';
import 'package:hakerkernel_taskflutter/screens/MyHomePage.dart';
import 'package:hakerkernel_taskflutter/services/WebServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  TextEditingController _passController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
bool load = false;
  SharedPreferences? preferences;
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // _checkIfLoggedIn();
     // _navigatetologin();
  //  getprefences();
  }
  // getprefences() async{
  //   SharedPreferences pre = await SharedPreferences.getInstance();
  //   //Future.delayed(Duration)
  //   pre.getString("token");
  //   pre.getBool("login");
  // }
onwillpop(){
  Future.delayed(const Duration(milliseconds: 1000), () {
    SystemNavigator.pop();
   // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('assets/images/logo.png')),
                  ),
                ),
               hSizedBox3,
               _emailfield(),
                hSizedBox2,
                _passfield(),

                hSizedBox4,
              load== true?CircularProgressIndicator():  Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: MyColors.bluecolor, borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () async{
                      setState(() {
                        load = true;
                      });
                     await WebServices.loginRequest(_emailController.text, _passController.text, context);
                      setState(() {
                        load = false;
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: MyColors.whiteColor, fontSize: 25),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){

                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: MyColors.secondaryColor, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                Text('New User? Create Account')
              ],
            ),
          ),
        ),
      ),
    );
  }
  _emailfield(){
    return Container(

      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: MyColors.lightBlackColor,
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        controller: _emailController,
        //focusNode: passfocus,
        decoration:  InputDecoration(
            hintText: "Email",
            //label: Text("Email"),
            hintStyle: TextStyle(color: MyColors.greycolor,fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            border: InputBorder.none
        ),

      ),
    );
  }
  _passfield(){
    return Container(

      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: MyColors.lightBlackColor,
      ),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: _passController,
        //focusNode: passfocus,
        decoration:  InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: MyColors.greycolor,fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            border: InputBorder.none
        ),

      ),
    );
  }
  // void _checkIfLoggedIn() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var login = preferences.getBool('login');
  //   var token = preferences.getString("token");
  //   print("user${token}");
  //   print("${login}");
  //   if (login != null) {
  //     setState(() {
  //       check = true;
  //     });
  //   }
  // }

  // void _navigatetologin() async{
  //
  //   await Future.delayed(Duration(milliseconds: 0),(){});
  //
  //   if(check){
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage(title: "Home")));
  //   }
  //   else {
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
  //   }
  // }
}