import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:zewin/layout/layoutScreen.dart';
import 'package:zewin/provider/provider.dart';
import 'package:zewin/screens/settingScreen.dart';

import 'package:zewin/screens/whatsappScreen.dart';
import 'package:flutter/material.dart';
import 'package:zewin/splash/splashSceern.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Demo',
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        WhatsappScreen.routeName: (context) => WhatsappScreen(),
        Layout_screen.routeName:(context) => Layout_screen(),
        Setting_Screen.routeName:(context) => Setting_Screen(),

      },
    );
  }
}
