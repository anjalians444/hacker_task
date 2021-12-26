import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hakerkernel_taskflutter/constanse/color.dart';
import 'package:hakerkernel_taskflutter/constanse/sizedbox.dart';
import 'package:hakerkernel_taskflutter/model/PhotosModel.dart';
import 'package:hakerkernel_taskflutter/services/WebServices.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  PhotosState createState() => PhotosState();
}

class PhotosState extends State<Photos> {
  List<PhotosModel> photoModel = [];
  bool load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getphotodata();
  }

  getphotodata() async{
    setState(() {
      load = true;
    });
    photoModel = await WebServices.fetchph();
    print("photos${photoModel.length}");
    setState(() {
      load = false;
    });

  }
  void urlToFile(String imageUrl) async {
//     final Directory directory = await getTemporaryDirectory();
//     var rng = new Random();
//     String tempPath = directory.path;
//
//     File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// // call http.get method and pass imageUrl into it to get response.
//     http.Response response = await http.get(Uri.parse(imageUrl));
// // write bodyBytes received in response to file.
//     await file.writeAsBytes(response.bodyBytes);
//     Fluttertoast.showToast(msg: "file${file.path}");
//     await OpenFile.open(file.path);

    final http.Response responseData = await http.get(Uri.parse(imageUrl));
    Uint8List  uint8list = responseData.bodyBytes;
    var buffer = uint8list.buffer;
    ByteData byteData = ByteData.view(buffer);
    //appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
    var tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/imdg.jpg').writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
   // Fluttertoast.showToast(msg: "file${file.path}");
  await OpenFile.open(file.path);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child:ListView.builder(
            itemCount: photoModel.length,
            itemBuilder: (context,i){
          return load == true? CircularProgressIndicator(): Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 130,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: NetworkImage(""),
              //
              // ),
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: GestureDetector(
              onTap: () async{

               urlToFile(photoModel[i].url);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                          NetworkImage(photoModel[i].thumbnailUrl)
                        )
                      ),
                    ),
                    wSizedBox1,
                    Container(
                      width: 180,
                      child: Text(photoModel[i].title,style: TextStyle(color: MyColors.blackColor,fontSize: 16,fontWeight: FontWeight.w700),),),
                   // Container(child: Text(photoModel[i,style: TextStyle(color: MyColors.blackColor,fontSize: 10,fontWeight: FontWeight.w700),),),
                  ],
                ),
              ),
            ),
          );
        })
      ),
    );
  }
}
