import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zewin/model/whatappModel.dart';

import '../sheard/remote/firbaseUtilis.dart';

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
  //----------------------------
var phoneController=TextEditingController();
  var sendPhoneController=TextEditingController();


  //------------------------
  WhatsData? userModel;
  User? firebaseUser;
  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      initUser();
    }
  }
  void initUser()async{
    userModel=await readUserFromFirestore(firebaseUser?.uid??"");
  }

}

