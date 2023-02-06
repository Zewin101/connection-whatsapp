


import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlCreate{
 static String message =
      ' السلام علكم ورحمة الله وبركاته\nمحل الساحة لخدمات الكمبيوتر والانترنت \nللتواصل يرجى الاتصال 0558568986 ';

  static Future<void> launchUrl1(text) async {
    var androidUrl = "whatsapp://send?phone=$text&text=$message";
    var iosUrl = "https://wa.me/$text?text=${Uri.parse('$message')}";
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      EasyLoading.showError('WhatsApp is not installed.');
    }
  }
}