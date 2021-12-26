import 'package:flutter/material.dart';
import 'package:hakerkernel_taskflutter/constanse/color.dart';
import 'package:hakerkernel_taskflutter/constanse/sizedbox.dart';
import 'package:hakerkernel_taskflutter/model/PostModel.dart';
import 'package:hakerkernel_taskflutter/screens/MyHomePage.dart';
import 'package:hakerkernel_taskflutter/services/WebServices.dart';

import 'PostDescription.dart';


class Posts extends StatefulWidget {

  const Posts({Key? key}) : super(key: key);

  @override
  PostsState createState() => PostsState();
}

class PostsState extends State<Posts> {
    List<PostModel> postmodel =[];
  bool load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async{
    setState(() {
      load = true;
    });
   postmodel = await WebServices.fetchpostRequest();
    print("posts${postmodel.length}");
    setState(() {
      load = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body:  SafeArea(
          child:load == true?Center(child: CircularProgressIndicator()): ListView.builder(
              itemCount: postmodel.length,
              itemBuilder: (context ,i){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> PostDes(postModel: postmodel[0],)));
                },
                child: Container(
                //  margin: EdgeInsets.only(top: 20),
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(""),

                      ),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      children: [

                        Container(

                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(top: 10,right: 20,left: 20),
                          child: Text(postmodel[i].title,textAlign: TextAlign.start,style: TextStyle(color: MyColors.blackColor,fontSize: 17,fontWeight: FontWeight.w700),),),

                       hSizedBox2,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.topLeft,
                          child: Text(postmodel[i].body,textAlign: TextAlign.justify, maxLines: 3,softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(color: MyColors.greycolor,fontSize: 10,fontWeight: FontWeight.w700),),),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })
      ),
    );
  }
}
