import 'dart:io';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'data.dart';
import 'editPage.dart';

class shayaripage extends StatefulWidget {
  const shayaripage({super.key});

  @override
  State<shayaripage> createState() => _shayaripageState();
}
class _shayaripageState extends State<shayaripage> {
  var result;
  List tap=[0,0,0,0,0,0,0,0,0,0];
  List imagetap=[0,0,0,0,0,0,0,0,0,0];
  WidgetsToImageController ic0=WidgetsToImageController();
  WidgetsToImageController ic1=WidgetsToImageController();
  WidgetsToImageController ic2=WidgetsToImageController();
  WidgetsToImageController ic3=WidgetsToImageController();
  WidgetsToImageController ic4=WidgetsToImageController();
  WidgetsToImageController ic5=WidgetsToImageController();
  WidgetsToImageController ic6=WidgetsToImageController();
  WidgetsToImageController ic7=WidgetsToImageController();
  WidgetsToImageController ic8=WidgetsToImageController();
  WidgetsToImageController ic9=WidgetsToImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${Data.category[Data.mainpageindex]} Status ${Data.sayaripageindex+1}"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              WidgetsToImage(
                controller: index==0?ic0:index==1?ic1:index==2?ic2:index==3?ic3:index==4?ic4:index==5?ic5:index==6?ic6:index==7?ic7:index==8?ic8:ic9,
                child: InkWell(
                  onTap: () {
                    tap[index]++;
                    if(tap[index]==30){
                      tap[index]=0;
                    }
                    Data.shayaripageimagetap=0;
                    imagetap[index]=1;
                    setState(() {});
                  },
                  child: Container(
                    height: 330,
                    width: 400,
                    margin: EdgeInsets.fromLTRB(7,7,7,0),
                    child: ListTile(
                      title: Text("${Data.all[Data.mainpageindex][Data.sayaripageindex][index]}",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
                    ),
                    decoration: BoxDecoration(
                      color:(Data.shayaripageimagetap==1 || imagetap[index]==0)?Data.colorlist[index]:null,
                      image: (Data.shayaripageimagetap==0 && imagetap[index]==1)?
                      DecorationImage(image:AssetImage('images/${Data.conimage[tap[index]]}'),fit: BoxFit.fill):null,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if(Data.iconchange[Data.mainpageindex][Data.sayaripageindex][index]==1){
                          Data.iconchange[Data.mainpageindex][Data.sayaripageindex][index]=0;
                          //remove
                          Data.favourite.remove("${Data.all[Data.mainpageindex][Data.sayaripageindex][index]}");
                        }else{
                          Data.iconchange[Data.mainpageindex][Data.sayaripageindex][index]=1;//add
                          Data.favourite.add("${Data.all[Data.mainpageindex][Data.sayaripageindex][index]}");

                        }
                        Fluttertoast.showToast(
                            msg: "${Data.iconchange[Data.mainpageindex][Data.sayaripageindex][index]==0?"Removed":"Added"}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color:Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(11,0,0,20),
                      child: ListTile(
                        trailing: Icon(Data.iconchange[Data.mainpageindex][Data.sayaripageindex][index]==0?Icons.favorite_border:Icons.favorite_outlined,size: 30,color: Colors.red,),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Saved",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                    },
                    child: InkWell(
                      onTap: () async {
                        Fluttertoast.showToast(
                            msg: "Save",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        final bytes=await (index==0?ic0:index==1?ic1:index==2?ic2:index==3?ic3:index==4?ic4:index==5?ic5:index==6?ic6:index==7?ic7:index==8?ic8:ic9).capture();
                        print("img=$bytes");
                        //var path= await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOAD);
                        Directory? directory = await getExternalStorageDirectory();
                        if (directory != null) {
                          print(directory.path);
                        }
                        var path;
                        path=(directory!.path+"/imgs");
                        print("Path=$path");
                        Directory dir=Directory(path);
                        if(!await dir.exists()){
                          dir.create();
                        }
                        int r=Random().nextInt(100000);
                        String imgName=r.toString()+".png";
                        File file=File("${dir.path}/${imgName}");
                        await file.writeAsBytes(bytes!);
                        XFile xFile=XFile(file.path);
                        setState(() {
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color:Colors.white,
                        ),
                        margin: EdgeInsets.fromLTRB(0,0,0,20),
                        child: ListTile(
                          trailing: Icon(Icons.file_download,size: 30,),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        FlutterClipboard.copy(Data.all[Data.mainpageindex][Data.sayaripageindex][index]).then(( value ) => print("copied"));
                        Fluttertoast.showToast(
                            msg: "Status Copied",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color:Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(0,0,0,20),
                      child: ListTile(
                        trailing: Icon(Icons.copy,size: 30,),
                      ),
                    ),
                  ),
                  InkWell(
                    //share as Text
                    // onTap: () async{
                    //   Fluttertoast.showToast(
                    //       msg: "Share as Text",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.BOTTOM,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: Colors.black54,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0
                    //   );
                    //   result=(await Share.share("${Data.all[Data.mainpageindex][Data.spindex][index]}")) as int;
                    //   Share.share(result);
                    //   setState(() {});
                    // },
                    //share as image
                    onTap: () async {
                      Fluttertoast.showToast(
                          msg: "Share as Image",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      final bytes=await (index==0?ic0:index==1?ic1:index==2?ic2:index==3?ic3:index==4?ic4:index==5?ic5:index==6?ic6:index==7?ic7:index==8?ic8:ic9).capture();
                      print("img=$bytes");
                      Directory? directory = await getExternalStorageDirectory();
                      if (directory != null) {
                        print(directory.path);
                      }
                      var path;
                      path=(directory!.path+"/imgs");
                      print("Path=$path");
                      Directory dir=Directory(path);
                      if(!await dir.exists()){
                        dir.create();
                      }
                      int r=Random().nextInt(100000);
                      String imgName=r.toString()+".png";
                      File file=File("${dir.path}/${imgName}");
                      await file.writeAsBytes(bytes!);
                      XFile xFile=XFile(file.path);
                      var shareFiles=Share.shareXFiles([xFile]);
                      setState(() {
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color:Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(0,0,0,20),
                      child: ListTile(
                        trailing: Icon(Icons.share,size: 30,),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:() {
                      setState(() {
                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                          Data.editpageindex=index;
                          Data.entereditbg=1;
                          Data.enteredittxt=1;
                          Data.entereditimg=1;
                          Data.bgimgtap=1;
                          Data.enterfontstyle=1;
                          return editpage();
                        },));
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color:Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(0,0,0,20),
                      child: ListTile(
                        trailing: Icon(Icons.edit,size: 30,),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },),
    );
  }
}
