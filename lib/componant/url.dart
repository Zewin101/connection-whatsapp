import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlCreate {
  // static String messageWhats =
  //     ' السلام علكم ورحمة الله وبركاته\nمحل الساحة لخدمات الكمبيوتر والانترنت \nللتواصل يرجى الاتصال 0558568986 ';

  static Future<void> launchUrlWhatsapp({required numPhone, String? messageWhats}) async {
    var androidUrl = "whatsapp://send?phone=$numPhone&text=$messageWhats";
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse('$messageWhats')}";

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

  static Future<void> launchUrlSms({required numPhone, String? messageWhats}) async {
    var androidUrl = "sms:$numPhone";
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse('$messageWhats')}";
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
  static Future<void> launchUrlCall({required numPhone, String? messageWhats}) async {
    var androidUrl = "tel:$numPhone";
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse('$messageWhats')}";
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
  static Future<void> launchUrlMessenger({required numPhone, String? messageWhats}) async {
    var androidUrl = "http://m.me/${10211503990573306}";
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse('$messageWhats')}";
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
