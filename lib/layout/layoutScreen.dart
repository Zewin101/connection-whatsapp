
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:zewin/componant/snackBar.dart';
import 'package:zewin/componant/url.dart';

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
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          image: AssetImage(Assets.imageBack),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Image.asset(
          Assets.imageWhatsAppLogo,
          fit: BoxFit.contain,
          color: Colors.white.withOpacity(0.3),
          colorBlendMode: BlendMode.modulate,
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
                  TextStyle(color: Colors.green,
                      fontSize: 55,
                      fontWeight: FontWeight.w900),
            ),
            toolbarHeight: 150,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print("${number.phoneNumber}");
                        },
                        onInputValidated: (bool value) {
                          print(value);
                          showMessage(
                            context,
                            controller: controller.text,
                            ok: value,
                          );
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        selectorTextStyle: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 25),
                        initialValue: number,
                        textFieldController: controller,
                        formatInput: true,
                        textStyle: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 25),
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(13),
                        ],
                        controller: whatsappController,
                        decoration: InputDecoration(
                          hintText: "         ادخل الرقم كامل بكود الدولة",
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8
                        ),
                        child: Container(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green, // foreground
                              ),
                              onPressed: () {
                                showMessage(context,
                                    controller: whatsappController.text, ok: true);
                              },
                              child: Text(
                                "Whatsapp",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8
                        ),
                        child: Container(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green, // foreground
                              ),
                              onPressed: () {
                                UrlCreate.launchUrlSms(whatsappController.text);
                                print(whatsappController.text);
                              },
                              child: Text(
                                "SMS",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8
                        ),
                        child: Container(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green, // foreground
                              ),
                              onPressed: () {
                                UrlCreate.launchUrlCall(whatsappController.text);
                              },
                              child: Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8
                        ),
                        child: Container(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green, // foreground
                              ),
                              onPressed: () {
                                 UrlCreate.launchUrlMessenger(whatsappController.text);

                              },
                              child: Text(
                                "Messenger",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
