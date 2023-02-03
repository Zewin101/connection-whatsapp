import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage(Assets.imageBackground),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: whatsappController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  child: IconButton(
                    onPressed: () => showMessage(context),
                    icon: Image.asset(
                      Assets.imageWhatsapp,
                    ),
                  ),
                ),
              ],
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
    else{
      _launchUrl(text);
    }
  }

  Future<void> _launchUrl(text) async {
    var _url = Uri.parse("https://api.whatsapp.com/send?phone=966$Text");
    if (await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
