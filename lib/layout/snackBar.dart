

import 'package:flutter/material.dart';
import 'package:zewin/layout/url.dart';

var snackBar = const SnackBar(
  content: Text(
    'اكمل كتابة الرقم صحيح ',
    textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.red,
);


void showMessage(BuildContext context,{ bool? ok, String? controller}) {
  var text = controller;
  if (!ok!) {
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    UrlCreate.launchUrl1(text);
  }
}