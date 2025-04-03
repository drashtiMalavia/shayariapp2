import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayariapp2/shayaripage.dart';

import 'data.dart';

class statuspage extends StatefulWidget {
  const statuspage({super.key});

  @override
  State<statuspage> createState() => _statuspageState();
}

class _statuspageState extends State<statuspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${Data.category[Data.mainpageindex]}"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  Data.sayaripageindex=index;
                  Data.shayaripageimagetap=1;
                  return shayaripage();
                },));
              });
            },
            child: SizedBox(
              height: 70,
              child: Card(
                color: Color.fromRGBO(0, 100,200,100),
                elevation: 10,
                child: ListTile(
                  title: Text("${Data.category[Data.mainpageindex]} Status ${index+1}",style: TextStyle(fontSize: 21),),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('images/${Data.image[Data.mainpageindex]}'),
                  ),
                  trailing: Icon(Icons.navigate_next,size: 50,),
                ),
              ),
            ),
          );
        },),
    );
  }
}
