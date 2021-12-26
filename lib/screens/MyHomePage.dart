import 'dart:convert';
import 'dart:io';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hakerkernel_taskflutter/constanse/color.dart';
import 'package:hakerkernel_taskflutter/constanse/globalkey.dart';
import 'package:hakerkernel_taskflutter/constanse/icons.dart';
import 'package:hakerkernel_taskflutter/constanse/sizedbox.dart';
import 'package:hakerkernel_taskflutter/screens/Posts.dart';
import 'package:hakerkernel_taskflutter/screens/Home.dart';
import 'package:hakerkernel_taskflutter/screens/LoginPage.dart';
import 'package:hakerkernel_taskflutter/screens/Photos.dart';
import 'package:shared_preferences/shared_preferences.dart';
final GlobalKey<ScaffoldState> key = GlobalKey();
class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);


  String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  int _pageIndex = 5;
  int currentindex = 0;
  String email = "";
  bool isDrawerOpen = false;
  bool isAppbar = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprefences();
  }


  var _pageData = [
    Home(),
    Posts(),
    Photos()
  ];
  getprefences() async{
    SharedPreferences pre = await SharedPreferences.getInstance();
    //Future.delayed(Duration)
    pre.getString("token");
    email = pre.getString("email") == null ? "@gmail.com" :pre.getString("email")!;
    print("email${email}");
    pre.getBool("login");
    setState(() {

    });
  }

  toggleDrawer() async {
    if (key.currentState!.isDrawerOpen) {
      key.currentState!.openEndDrawer();
    } else {
      key.currentState!.openDrawer();
    }
  }
  onwillpop(){
     // exit(0);
     // SystemNavigator.pop();
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      key: key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.whiteColor,
        title: Text(widget.title,style: TextStyle(color: MyColors.blackColor),),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Row(children: [
              Container(
                child: Icon(Icons.search,size: 30,color: MyColors.blackColor,),
              ),
              wSizedBox2,
              Container(
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                      "assets/images/photo.jpg"),
                ),
              )
            ],),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
              onTap: (){
                toggleDrawer();
                                setState(() {

                                });
              },
              child: Image.asset("assets/images/menuuu.png",color: MyColors.bluecolor,height: 3,width: 3,)),
        ),
      ),
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: MyColors.bluecolor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0),bottomRight: Radius.circular(60.0))
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15,top: 50),
                      alignment: Alignment.bottomLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/images/photo.jpg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15,top: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Anjali Singh",
                        style: TextStyle(color: MyColors.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 18,top: 5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        email , style: TextStyle(color: MyColors.whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              hSizedBox1,
              ListTile(
                title: const Text('DashBoard', style: TextStyle(
                    color: MyColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),),
                onTap: () {
                  key.currentState!.setState(() {
                    currentindex == 0;
                  });
                  widget.title = "Home";
                  _pageData[currentindex = 0];
                  setState(() {

                    toggleDrawer();
                  });
                },
              ),
              Divider(thickness: 1,),
              ListTile(
                title: const Text('Posts', style: TextStyle(
                    color: MyColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),),
                onTap: () {
                  key.currentState!.setState(() {
                    currentindex == 1;
                  });
                  widget.title = "Post";
                  _pageData[currentindex = 1];
                  toggleDrawer();
                  setState(() {

                  });
                },
              ),
              Divider(thickness: 1,),
              ListTile(
                title: const Text('Photos', style: TextStyle(
                    color: MyColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
                onTap: () {
                  print("photos");
                  key.currentState!.hasEndDrawer;
                  key.currentState!.setState(() {
                    currentindex == 2;
                    toggleDrawer();
                  });
                  widget.title = "Photos";
                  _pageData[currentindex = 2];

                  setState(() {

                  });


                }
              ),
              hSizedBox5,hSizedBox5,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.only(left: 50,right: 50),
                height: 50,
                decoration: BoxDecoration(color: MyColors.bluecolor,
                  borderRadius: BorderRadius.circular((15.0))
                ),
                child: Center(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.power,color: MyColors.whiteColor,size: 20,),
                    title: const Text('LOGOUT', style: TextStyle(
                        color: MyColors.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                    onTap: () async{
                      await _showMyDialog();
                     // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                      print("logout");
                    },
                  ),
                ),
              ),
            ]
        ),
      ),


      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
          currentIndex: currentindex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,
                  size: 25,
                  color:
                  currentindex == 0 ? Color(0xff003b73) : Color(0xff666666),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.store,
                  size: 25,
                  color:
                  currentindex == 1 ? Color(0xff003b73) : Color(0xff666666),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_rounded,
                  size: 25,
                  color:
                  currentindex == 2 ? Color(0xff003b73) : Color(0xff666666),
                ),
                label: ""),
          ],
          //  iconSize: 10,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          selectedItemColor: Color(0xff003b73),
          unselectedItemColor: Color(0xff666666).withOpacity(.60),
          onTap: onTabTapped,
          //{
          //   setState(() {
          //     currentindex = setvalue;
          //   }

        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          color: MyColors.whiteColor,
          child: Container(
           padding: EdgeInsets.only(top: 20),
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.8,
              child: _pageData[currentindex]),
        ),
      ),
    );
  }

  void onTabTapped(int i) {
    currentindex = i;

    setState(() {
   if (i == 1) {

        widget.title = "Post";

    }
   else if (i == 2)
 {
        widget.title = "Photos";

    }
   else if(i == 0){
     setState(() {
       widget.title = "Home";
     });
   }
    else{

        widget.title == "Home";

    }
    });

  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Are you sure?',style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),),
            content: Text('You want to log out',style: TextStyle(fontSize: 14,color: Colors.black)),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('No')),
              TextButton(onPressed: (){
                Navigator.of(context).pop(false);
                clearSharedPreference();
                // restartApp();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

              }, child: Text('Yes'))
            ],
        );
      },
    );
  }
  Future<void> clearSharedPreference()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    //preferences.setString("token", value)
  }
}

