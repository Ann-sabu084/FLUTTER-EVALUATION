import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/reelspage.dart';

class Reelsnewpage extends StatelessWidget {
  const Reelsnewpage({super.key});

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      scrollDirection:Axis.vertical,
      itemCount: 5,  itemBuilder:(context, index) {
      
      return reelspage();
    },);
  }
}