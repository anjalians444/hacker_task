import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hakerkernel_taskflutter/constanse/color.dart';
import 'package:hakerkernel_taskflutter/constanse/sizedbox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.topLeft,
                child: Text("Featured Articles",style: TextStyle(color: MyColors.blackColor,fontWeight: FontWeight.w700,fontSize: 20),),
              ),
              //hSizedBox4,
              Material(
                color: MyColors.whiteColor,
                child: Container(
                  height: 300,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  child: Material(
                    child: ListView.builder(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                      return Material(
                        elevation: 10,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 250,
                          width: 170,
                          decoration: BoxDecoration(
                            image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/photo.jpg")
                            ),
                             borderRadius: BorderRadius.circular(15.0)
                          ),
                          child:Column(
                            children: [
                              Container(

                                height: 40,
                               // width: 40,
                                alignment:  Alignment.topLeft,
                                child: premium(),
                              ),
                            hSizedBox5,
                            hSizedBox4,
                              hSizedBox4,
                            Container(
                              alignment:  Alignment.bottomLeft,
                              child:_featuredcard(index) ,)
                            ],
                          )
                        ),
                      );
                    }),
                  ),

                ),
              ),

              hSizedBox4,
              Container(
                height: 50,
                //width: 200,
                padding: EdgeInsets.only(left: 15,),
                alignment: Alignment.topLeft,
                child: Text("Featured Videos",style: TextStyle(color: MyColors.blackColor,fontWeight: FontWeight.w700,fontSize: 20),),
              ),
            //  hSizedBox4,

              Material(
                color: MyColors.whiteColor,
                child: Container(
                    color: MyColors.whiteColor,
                  alignment: Alignment.topLeft,
                   height: 130,
                  width: 350,
                  margin: EdgeInsets.symmetric(horizontal: 15,),
                  child:Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, i){
                      return Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 130,
                        width: 250,
                        decoration: BoxDecoration(
                            image:  DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/yoga.jpg")
                            ),
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                           child:  Stack(
                             children: [
                               Column(
  children: [
    Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(right: 180),
      height: 30,
      width: 80,
      decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                MyColors.bluecolor,
              ],
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                bottomRight: Radius.circular(15.0))
      ),
      child: Center(child: Text("01:25:00",style: TextStyle(color: MyColors.whiteColor,fontSize: 12,fontWeight: FontWeight.w500),)),
    ),
    hSizedBox4,
    hSizedBox2,
    Container(
      alignment: Alignment.bottomLeft,
      child: Container(
           margin: EdgeInsets.only(left: 10),
            height: 30,
            width: 30,
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(80.0)),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  istrue = true;
                });
              },
              child: Icon(Icons.star, color: istrue == true? Colors.blue:MyColors.greycolor,size: 25,),
            )

          // Image.asset("assets/images/star.svg",color: istrue == true? Colors.blue:MyColors.whiteColor,)),
      ),
    ),
  ],
),

                               Center(
                                 child: Container(
                                   height:20,
                                   width:40,
                                   child: Center(child: Icon(CupertinoIcons.play_rectangle_fill,size: 35,color: MyColors.whiteColor,)),
                                 ),
                               )
                             ],
                           ),
                      );
                    }),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _videoscard(){
  }
  _featuredcard(int index){
    return Container(
      padding: EdgeInsets.only(left: 20,top: 10),
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              MyColors.bluecolor,
            ],
          ),
            borderRadius: BorderRadius.only(topRight: Radius.circular(18.0),
            topLeft: Radius.circular(18.0),
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0))
      ),
      child:Column(
        children: [

          Container(
            alignment:Alignment.topLeft,child: Text("5 Minutes of daily Yoga",style: TextStyle(color: MyColors.whiteColor,fontSize: 16,fontWeight: FontWeight.w600),),)

         , Container(
            alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(top: 10,left: 13),
           child: Row(
              children: [
                Container
                  (

            child: Text("Read Now",style: TextStyle(color: MyColors.whiteColor,fontSize: 14,fontWeight: FontWeight.w600),),),

             Container(
               margin: EdgeInsets.only(left: 20),
               height: 30,
               width: 30,
               decoration: BoxDecoration(color: Colors.white,
             borderRadius: BorderRadius.circular(80.0)),
    child: GestureDetector(
    onTap: (){
      setState(() {
        istrue = true;
      });
    },
      child: Icon(Icons.star, color: istrue == true? Colors.blue:MyColors.greycolor,size: 25,),
    )

   // Image.asset("assets/images/star.svg",color: istrue == true? Colors.blue:MyColors.whiteColor,)),
    )
              ],
            ),
         )

        ],
      ) ,
    );
  }
  premium(){
    return Visibility(
      visible: istrue,
      child: Container(
        height: 40,width: 40,
        decoration: BoxDecoration(
          color: MyColors.bluecolor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),
          topLeft: Radius.circular(15.0))
        ),
        child: Center(child: SvgPicture.asset("assets/images/premium.svg",color: MyColors.whiteColor,height: 20,width: 20,))
      ),
    );
  }
}
