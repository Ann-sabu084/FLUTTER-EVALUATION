import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'searchpage.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Consumer<Counterprovider>(builder: (context, value, child) {
        return Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              value.sub();
            }, child: Icon(Icons.remove)),
            Text(value.a.toString()),
            ElevatedButton(onPressed: (){
              value.add();
            }, child: Icon(Icons.add)),
           
              
          ],
        );
      },),),
    );
  }
}