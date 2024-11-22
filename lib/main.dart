import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/counterpage.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/fruithome.dart';
import 'package:flutter_application_1/loginpage.dart';
import 'package:flutter_application_1/productlpage.dart';
import 'package:flutter_application_1/reelsnewpage.dart';
import 'package:flutter_application_1/reelspage.dart';
import 'package:flutter_application_1/searchpage.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flipkart Clone',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
