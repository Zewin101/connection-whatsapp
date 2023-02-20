import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zewin/provider/provider.dart';

import '../generated/assets.dart';
import '../layout/layoutScreen.dart';
import '../sheard/remote/firbaseUtilis.dart';

class Login_Screen extends StatefulWidget {
  Login_Screen({Key? key}) : super(key: key);
  static const String routeName = "loginScreen";

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late UserCredential credential;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Stack(alignment: Alignment.bottomCenter, children: [
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
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Whatsapp',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 55,
                  fontWeight: FontWeight.w900),
            ),
            toolbarHeight: MediaQuery.of(context).size.height*.15,
          ),
          body: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "يرجى ادخال رقم الجوال ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*.05,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            textDirection: TextDirection.rtl,
                            controller: provider.phoneController,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            validator: (value){
                              String patttern = r'(^(?:[+0]9)?[0-9]{13,15}$)';
                              RegExp regExp = new RegExp(patttern);
                              if (value?.length == 0) {
                                return 'Please enter mobile number';
                              }
                              else if (!regExp.hasMatch(value!)) {
                                return 'ادخل رقم الجوال مع اضافة كود الدولة 009661234567890';
                              }
                              return null;

                            },
                            decoration: InputDecoration(
                              labelText: "  رقـــم الجــوال ",
                              suffixIcon: Icon(Icons.phone_iphone_rounded),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height*.06,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*.08,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),

                              onPressed: () async {
                               await Login();

                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height*.05
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Login()async{
    if(formKey.currentState!.validate()){
      await signInAnonymously();
      Navigator.pushReplacementNamed(context, Layout_screen.routeName);
    }
  }
  signInAnonymously() async {
    //anonymous Authentication
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      print(userCredential.user?.uid);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
