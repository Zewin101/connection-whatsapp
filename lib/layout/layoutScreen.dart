import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/assets.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);
  static const String routeName = "home";

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  var whatsappController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'SA';
  PhoneNumber number = PhoneNumber(isoCode: 'SA');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(11, 35, 39, 255),
        ),
        const Image(
          image: AssetImage(Assets.imageBack),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Whatsapp',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w900),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    image: AssetImage(Assets.imageWhatsapp),
                    height: 200,
                    width: 200,
                  ),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                    initialValue: number,
                    textFieldController: whatsappController,
                    formatInput: true,
                    textStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      fontSize: 25
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: const OutlineInputBorder(),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: IconButton(
                      onPressed: () => showMessage(context),
                      icon: Image.asset(
                        Assets.imageSend,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  var snackBar = const SnackBar(
    content: Text(
      'رقم الجوال غير صحيح ',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );

  void showMessage(context) {
    var text = whatsappController.text;
    if (text.length < 10 || text.length > 10) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else {
      launchUrl1(text);
    }
  }

  String message =
      ' السلام علكم ورحمة الله وبركاته\nمحل الساحة لخدمات الكمبيوتر والانترنت \nللتواصل يرجى الاتصال 0558568986 ';

  Future<void> launchUrl1(text) async {
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
