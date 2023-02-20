import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zewin/provider/provider.dart';
import 'package:zewin/screens/whatsappScreen.dart';
import '../componant/url.dart';
import '../generated/assets.dart';
import '../screens/settingScreen.dart';

class Layout_screen extends StatelessWidget {
  const Layout_screen({Key? key}) : super(key: key);
  static const String routeName = "Layout";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
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
          extendBody: true,
          backgroundColor: Colors.transparent,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            shape:
                StadiumBorder(side: BorderSide(width: 3, color: Colors.white)),
            onPressed: () {
              UrlCreate.launchUrlCall(numPhone: provider.sendPhoneController.text,
                  messageWhats: provider.descriptionController.text);
            },
            child: Icon(Icons.phone),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.green,
            notchMargin: 8,
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    Assets.imageMenu,
                  )),
                  label: "Menu",
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                      Assets.imageApplications,
                    )),
                    label: "Setting"),
              ],
              iconSize: 30,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              onTap: (index) {
                provider.changeTap(index);
              },
              currentIndex: provider.currentIndex,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.green,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
            ],
          ),
          body:taps[provider.currentIndex] ,
        ),
      ],
    );
  }

}
List<Widget>taps=[
  WhatsappScreen(),
  Setting_Screen(),
];
