import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlCreate {
  static String message =
      ' السلام علكم ورحمة الله وبركاته\nمحل الساحة لخدمات الكمبيوتر والانترنت \nللتواصل يرجى الاتصال 0558568986 ';

  static Future<void> launchUrlWhatsapp(text) async {
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

  static Future<void> launchUrlSms(text) async {
    var androidUrl = "sms:$text";
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
  static Future<void> launchUrlCall(text) async {
    var androidUrl = "tel:$text";
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
  static Future<void> launchUrlMessenger(text) async {
    var androidUrl = "http://m.me/${10211503990573306}";
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
