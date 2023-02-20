



import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zewin/generated/assets.dart';
import 'package:zewin/screens/whatsappScreen.dart';

import '../layout/layoutScreen.dart';
import '../provider/provider.dart';
import '../screens/loginScreen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);
  static const String routeName="splash";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return EasySplashScreen(
      logo: Image(image: AssetImage(Assets.imageWhatsAppLogo)),
      title: Text(
        "zewin",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
            color: Colors.green
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading...",
      style: TextStyle(
        fontSize: 25,
          color: Colors.green
      ),
      ),
      navigator:provider.firebaseUser != null
          ? WhatsappScreen()
          :  Login_Screen(),
      durationInSeconds: 2,
      logoWidth:MediaQuery.of(context).size.width*0.60,
      loaderColor: Colors.green,
    );
  }
}