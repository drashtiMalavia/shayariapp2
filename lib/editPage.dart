import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'data.dart';

class editpage extends StatefulWidget {
  const editpage({super.key});

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  double size=30;
  var result;
  int tap=0;
  var edit;
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
  late TextEditingController txt;

  int imageindex=0;
  int imagtap=0;

  int font=0,f=0;

  var tempShayari;

  int add=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempShayari=Data.all[Data.mainpageindex][Data.sayaripageindex][Data.editpageindex];
    txt=TextEditingController(text: tempShayari);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Edit",),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          WidgetsToImage(
            controller: Data.editpageindex==0?ic0:Data.editpageindex==1?ic1:Data.editpageindex==2?ic2:Data.editpageindex==3?ic3:Data.editpageindex==4?ic4:Data.editpageindex==5?ic5:Data.editpageindex==6?ic6:Data.editpageindex==7?ic7:Data.editpageindex==8?ic8:ic9,
            child: Container(
              height: 460,
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    bottom: 5,
                    left: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          imagtap=0;
                          print("imgtap=${Data.entereditimg}");
                        });
                      },
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        color: (Data.entereditbg==1 && Data.entereditimg==1)?Colors.white:Data.licolor[Data.bgcolorindex],
                        child: Container(
                          decoration: BoxDecoration(
                            image: Data.entereditimg==0?DecorationImage(
                              image: AssetImage('images/${Data.conimage[imageindex]}'),
                              fit: BoxFit.fill,
                            ):null,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: InkWell(
                            onTap: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: Text("Add your own or edit"),
                                  content: TextField(
                                    controller: txt,
                                    onChanged: (value) {
                                      edit=value;
                                    },
                                    minLines: 1,
                                    maxLines: 5,
                                  ),
                                  actions: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            Navigator.pop(context);
                                            setState(() {
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 130,
                                            margin: EdgeInsets.fromLTRB(0,0,15,0),
                                            child: Text("Cancel"),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color:Colors.black12,
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap:(){
                                            setState(() {
                                              add=1;
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 130,
                                            child: Text("Add"),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color:Colors.grey,
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                            ),
                                            margin: EdgeInsets.fromLTRB(15,0,0,0),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },);
                            },
                            child: Center(
                              child: ListTile(
                                title: Text("${add==1?edit:Data.all[Data.mainpageindex][Data.sayaripageindex][Data.editpageindex]}",
                                    style: TextStyle(
                                      fontSize: size,
                                      color: Data.enteredittxt==1?Colors.black:Data.licolor[Data.textcolorindex],
                                      fontWeight: Data.style==1&& Data.enterfontstyle==0?FontWeight.bold:Data.style==3&& Data.enterfontstyle==0?FontWeight.bold:FontWeight.normal,
                                      fontStyle: Data.style==2 && Data.enterfontstyle==0?FontStyle.italic:Data.style==3 && Data.enterfontstyle==0?FontStyle.italic:FontStyle.normal,
                                      fontFamily: f==1?Data.font[font]:null,
                                    ),textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 340,
                    right: 0,
                    bottom: 20,
                    child: IgnorePointer(
                      ignoring: Data.bgimgtap==0?false:true,
                      child: ListView.builder(
                        itemCount: 30,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                imageindex=index;
                                Data.entereditimg=0;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                image: DecorationImage(image:
                                Data.bgimgtap==0?AssetImage('images/${Data.conimage[index]}'):AssetImage('${Colors.white}'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                Text("Text Size: ${size.toStringAsFixed(0)}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Expanded(flex: 2,
                  child: Slider(
                    value: size,
                    min: 10,
                    max: 50,
                    onChanged: (value) {
                      size=value;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                Text("Font Family ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                InkWell(
                  onTap:() {
                    showModalBottomSheet(context: context, builder: (context) {
                      return GridView.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 5,
                        ), itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            font=index;
                            f=1;
                            Navigator.pop(context);
                            setState(() {
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.yellow,
                            margin: EdgeInsets.all(10),
                            child: Text("Shayari",style: TextStyle(fontFamily: Data.font[index])),

                          ),
                        );
                      },);
                    },);
                    setState(() {
                    });
                  },
                  child: Container(
                    height: 50,
                    child: Text("font",style: TextStyle(fontSize: 30,fontFamily: f==1?Data.font[font]:null),),

                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  alignment: Alignment.centerLeft,
                  child: Text("  Bg Color",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                  decoration: BoxDecoration(
                    color:Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      constraints: BoxConstraints(
                          maxHeight: 190,
                          maxWidth: 500
                      ),
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          itemCount: 32,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ), itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                Data.entereditimg=2;
                                Data.entereditbg=0;
                                Data.bgcolorindex=index;
                              });
                            },
                            child: Container(
                              color: Data.licolor[index],
                            ),
                          );
                        },);
                      },);
                  },
                  child: Container(
                    height: 200,
                    width: 100,
                    margin: EdgeInsets.fromLTRB(0,0,10,0),
                    color: Data.entereditbg==1?Colors.white:Data.licolor[Data.bgcolorindex],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    width: 100,
                    alignment: Alignment.centerLeft,
                    child: Text("Text Color",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(
                      color:Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      constraints: BoxConstraints(
                          maxHeight: 190,
                          maxWidth: 500
                      ),
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          itemCount: 32,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ), itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                Data.enteredittxt=0;
                                Data.textcolorindex=index;
                              });
                            },
                            child: Container(
                              color: Data.licolor[index],
                            ),
                          );
                        },);
                      },);
                  },
                  child: Container(
                    height: 200,
                    width: 100,
                    color: Data.enteredittxt==1?Colors.black:Data.licolor[Data.textcolorindex],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 55,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Data.enterfontstyle=0;
                      showModalBottomSheet(
                        constraints: BoxConstraints(maxWidth: 350,maxHeight: 200),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 500,
                            width: 500,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 500,
                                  child: Text("Choose Style",style: TextStyle(fontSize: 20,),),
                                  alignment: Alignment.center,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Data.style=1;
                                        });
                                      },
                                      child: Expanded(
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          alignment: Alignment.center,
                                          child: Text("Bold",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900)),
                                          margin: EdgeInsets.fromLTRB(10,0,10,20),
                                          decoration: BoxDecoration(
                                            color:Colors.black12,
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Data.style=2;
                                        });
                                      },
                                      child: Expanded(
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          margin: EdgeInsets.fromLTRB(10,0,10,20),
                                          alignment: Alignment.center,
                                          child: Text("Italic",style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
                                          decoration: BoxDecoration(
                                            color:Colors.black12,
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Data.style=3;
                                        });
                                      },
                                      child: Expanded(
                                        child: Container(
                                          height: 50,
                                          width: 90,
                                          margin: EdgeInsets.fromLTRB(10,0,10,20),
                                          alignment: Alignment.center,
                                          child: Text("Bold Italic",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                          decoration: BoxDecoration(
                                            color:Colors.black12,
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(() {
                                    });
                                  },
                                  child: Expanded(
                                    child: Container(
                                      height: 40,
                                      width: 300,
                                      margin: EdgeInsets.fromLTRB(10,0,10,10),
                                      child: Text("Close",style: TextStyle(fontSize: 30,),),
                                      alignment:Alignment.center,
                                      decoration: BoxDecoration(
                                        color:Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0,0,2,0),
                      child: ListTile(
                        leading: Icon(Icons.format_bold,color: Colors.white,size: 30,),
                        title: Text("Style",style: TextStyle(fontSize: 20,color: Colors.white,),textAlign: TextAlign.left,),
                      ),
                      decoration: BoxDecoration(
                        color:Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if(Data.bgimgtap==0){
                        Data.bgimgtap=1;//1 hoy to image ni list show thay//0 hoy to no thay
                        imagtap=0;
                      }
                      else{
                        Data.bgimgtap=0;
                        imagtap=1;
                      }
                      setState(() {
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0,0,2,0),
                      child: ListTile(
                        leading: Icon(Icons.image,color: Colors.white,size: 30,),
                        title: Text("Bg-Image",style: TextStyle(fontSize: 15,color: Colors.white,),textAlign: TextAlign.left,),
                      ),
                      decoration: BoxDecoration(
                        color:Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("Add your own or edit"),
                          content: TextField(
                            controller: txt,
                            onChanged: (value) {
                              edit=value;
                            },
                            minLines: 1,
                            maxLines: 5,
                          ),
                          actions: [
                            Row(
                              children: [
                                InkWell(
                                  onTap:(){
                                    Navigator.pop(context);
                                    setState(() {
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    margin: EdgeInsets.fromLTRB(0,0,15,0),
                                    child: Text("Cancel"),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:Colors.black12,
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      add=1;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    child: Text("Add"),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:Colors.grey,
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      },);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0,0,2,0),
                      child: ListTile(
                        leading: Icon(Icons.edit,color: Colors.white,size: 30,),
                        title: Text("Edit",style: TextStyle(fontSize: 20,color: Colors.white,),textAlign: TextAlign.left,),
                      ),
                      decoration: BoxDecoration(
                        color:Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 55,
            child: Row(
              children: [
                Expanded(
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
                      // var path= await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
                      // path=path+"/image";
                      // Directory dir=Directory(path);
                      // if(!await dir.exists()){
                      //   dir.create();
                      // }
                      // int r=Random().nextInt(100000);
                      // String imgName=r.toString()+".png" as String;
                      // File file=File("${dir.path}/${imgName}");
                      // await file.writeAsBytes(bytes!);
                      // XFile xFile=XFile(file.path);
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
                        final bytes=await (Data.editpageindex==0?ic0:Data.editpageindex==1?ic1:Data.editpageindex==2?ic2:Data.editpageindex==3?ic3:Data.editpageindex==4?ic4:Data.editpageindex==5?ic5:Data.editpageindex==6?ic6:Data.editpageindex==7?ic7:Data.editpageindex==8?ic8:ic9).capture();
                        print("img=$bytes");
                        //var path= await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOAD);
                        // path=path+"/imgs";
                        // print("Path=$path");
                        Directory dir=Directory("path");
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
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0,0,2,0),
                        child: ListTile(
                          leading: Icon(Icons.download,color: Colors.white,size: 30,),
                          title: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white,),textAlign: TextAlign.left,),
                        ),
                        decoration: BoxDecoration(
                          color:Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
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
                    //   result=(await Share.share("${Data.all[Data.mainpageindex][Data.sayaripageindex][Data.editpageindex]}")) as int;
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
                      final bytes=await (Data.editpageindex==0?ic0:Data.editpageindex==1?ic1:Data.editpageindex==2?ic2:Data.editpageindex==3?ic3:Data.editpageindex==4?ic4:Data.editpageindex==5?ic5:Data.editpageindex==6?ic6:Data.editpageindex==7?ic7:Data.editpageindex==8?ic8:ic9).capture();
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
                    // onTap: () async {
                    //   final bytes=await (Data.editpageindex==0?ic0:Data.editpageindex==1?ic1:Data.editpageindex==2?ic2:Data.editpageindex==3?ic3:Data.editpageindex==4?ic4:Data.editpageindex==5?ic5:Data.editpageindex==6?ic6:Data.editpageindex==7?ic7:Data.editpageindex==8?ic8:ic9).capture();
                    //   print("img=$bytes");
                    //   //var path= await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOAD);
                    //   // path=path+"/imgs";
                    //   // print("Path=$path");
                    //   Directory dir=Directory("path");
                    //   if(!await dir.exists()){
                    //     dir.create();
                    //   }
                    //   int r=Random().nextInt(100000);
                    //   String imgName=r.toString()+".png";
                    //   File file=File("${dir.path}/${imgName}");
                    //   await file.writeAsBytes(bytes!);
                    //   XFile xFile=XFile(file.path);
                    //   var shareFiles=Share.shareXFiles([xFile]);
                    //   setState(() {
                    //   });
                    // },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0,0,2,0),
                      child: ListTile(
                        leading: Icon(Icons.share,color: Colors.white,size: 30,),
                        title: Text("Share",style: TextStyle(fontSize: 19,color: Colors.white,),textAlign: TextAlign.left,),
                      ),
                      decoration: BoxDecoration(
                        color:Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
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
                    //   result=(await Share.share("${Data.all[Data.mainpageindex][Data.sayaripageindex][Data.editpageindex]}")) as int;
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
                      final bytes=await (Data.editpageindex==0?ic0:Data.editpageindex==1?ic1:Data.editpageindex==2?ic2:Data.editpageindex==3?ic3:Data.editpageindex==4?ic4:Data.editpageindex==5?ic5:Data.editpageindex==6?ic6:Data.editpageindex==7?ic7:Data.editpageindex==8?ic8:ic9).capture();
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
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0,0,2,0),
                      child: ListTile(
                        leading: Icon(Icons.local_fire_department,color: Colors.white,size: 30,),
                        title: Text("Set-Status",style: TextStyle(fontSize: 16,color: Colors.white,),textAlign: TextAlign.left,),
                      ),
                      decoration: BoxDecoration(
                        color:Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
