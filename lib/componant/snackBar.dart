

import 'package:flutter/material.dart';
import 'package:zewin/componant/url.dart';

var snackBar = const SnackBar(
  content: Text(
    'اكمل كتابة الرقم صحيح ',
    textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.red,
);


void showMessage(BuildContext context,{ bool? ok, String? controllerNumber,String? controllerMessage}) {
  var text = controllerNumber;
  var textMessage=controllerMessage;
  if (!ok!) {
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    UrlCreate.launchUrlWhatsapp(numPhone: text,messageWhats: textMessage);

  }
}