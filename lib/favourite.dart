import 'package:flutter/material.dart';

import 'data.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favourites",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          itemCount: Data.favourite.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 20,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  child: Text("${Data.favourite[index]}",style: TextStyle(fontSize: 30),),
                  padding: EdgeInsets.all(50),
                ),
            );
          },
        )
      ),
    );
  }
}
