import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  int currentIndex=0;
  void changeTap(int index){
    currentIndex=index;
    notifyListeners();
  }
  //-----------------------------
  var descriptionController = TextEditingController(text: "السلام عليكم\n.. ");

  bool enabelEdit=false;
  void enableEditTextForm(bool enable){
    enabelEdit=enable;
    notifyListeners();
  }
}

