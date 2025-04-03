import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayariapp2/statusPage.dart';

import 'data.dart';
import 'favourite.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List li=[8,9,10,11,12,13,14,15];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Status",style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.green,
            actions: [
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FavouriteList();
                    },));
                  });
                },
                child: Icon(Icons.favorite,color: Colors.red,size: 30,),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)
                      {
                        Data.mainpageindex=index;
                        return statuspage();
                      },));
                    },
                    child: Container(
                      height: 220,
                      width: 200,
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color:Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(image: AssetImage('images/${Data.image[index]}'),alignment: Alignment.topCenter,fit: BoxFit.fitWidth)
                      ),
                      alignment: Alignment(0.5,1.2),
                      child: ListTile(
                        title: Text("${Data.category[index]}",style: TextStyle(color: Colors.white,fontSize: 21),),
                      ),
                    ),
                  ),//1st row
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                          Data.mainpageindex=li[index];
                          return statuspage();
                        },));
                      },
                      child: Container(
                        height: 220,
                        width: 200,
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color:Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: AssetImage('images/${Data.image[li[index]]}'),alignment: Alignment.topCenter,fit: BoxFit.fitWidth)
                        ),
                        alignment: Alignment(0.5,1.2),
                        child: ListTile(
                          title: Text("${Data.category[li[index]]}",style: TextStyle(color: Colors.white,fontSize: 21),),
                        ),
                      ),
                    ),
                  ),//2nd row
                ],
              );
            },)
      ),
    );
  }
  Future<void> askPermission() async{
    var status=await Permission.photos.status;
    if(status.isDenied){
      Map<Permission,PermissionStatus> statuses=await[
        Permission.photos,
        Permission.storage,
      ].request();
      Fluttertoast.showToast(
        msg: "Storage permission grantes",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 32,
      );
    }
  }
}
