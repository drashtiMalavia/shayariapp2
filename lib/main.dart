import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shayariapp2/mainpage.dart';

void main() {
 // WidgetsFlutterBinding.ensureInitialized(); // initialization no thay tya shudhi control aagal no jay..
  runApp(MaterialApp(home: mainPage(),debugShowCheckedModeBanner: false,));
}
