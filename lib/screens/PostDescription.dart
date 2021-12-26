import 'package:flutter/material.dart';
import 'package:hakerkernel_taskflutter/constanse/color.dart';
import 'package:hakerkernel_taskflutter/constanse/sizedbox.dart';
import 'package:hakerkernel_taskflutter/model/PostModel.dart';

class PostDes extends StatefulWidget {
  final PostModel postModel ;
   PostDes({Key? key,required this.postModel}) : super(key: key);

  @override
  _PostDesState createState() => _PostDesState();
}

class _PostDesState extends State<PostDes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Posts")
      ),
      body: Container(
        child: Column(
          children: [

            Container(

              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10,right: 20,left: 20),
              child: Text(widget.postModel.title,textAlign: TextAlign.start,style: TextStyle(color: MyColors.blackColor,fontSize: 18,fontWeight: FontWeight.w700),),),

            hSizedBox2,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.topLeft,
              child: Text(widget.postModel.body,textAlign: TextAlign.justify,style: TextStyle(color: MyColors.greycolor,fontSize: 14,fontWeight: FontWeight.w700),),),
          ],
        ),
      ),
    );
  }
}
