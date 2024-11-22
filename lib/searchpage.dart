import 'package:flutter/material.dart';

class Counterprovider extends ChangeNotifier{
  int a=0;
  void add()
  {
    a++;
    notifyListeners();
  }

void sub(){
  a--;
  notifyListeners();
}
}