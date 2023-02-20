import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zewin/model/whatappModel.dart';
import 'package:zewin/provider/provider.dart';
import 'package:zewin/sheard/remote/firbaseUtilis.dart';

class Setting_Screen extends StatefulWidget {
  Setting_Screen({Key? key}) : super(key: key);
  static const String routeName = "setting";

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
WhatsData whatsData=WhatsData(description: "السلاك عليكم ");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData(whatsData);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Whatsapp',
            style: TextStyle(
                color: Colors.green, fontSize: 55, fontWeight: FontWeight.w900),
          ),
          toolbarHeight: 150,
        ),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "النص الذي يظهر عند الارسال",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLength: 1000,
                      textDirection: TextDirection.rtl,
                      controller: provider.descriptionController,
                      // initialValue: "السلام عليكم",
                      maxLines: 6,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                        labelText: "كتابة النص",
                        prefixIcon: Icon(Icons.text_snippet_outlined),
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
                      enabled: provider.enabelEdit,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () async {
                          WhatsData whats = WhatsData(
                              description: provider.descriptionController.text);

                          if (provider.enabelEdit &&
                              provider.descriptionController.text != "") {
                            await updateUser(whats);


                            print("add to firebase");
                          } else {}

                          provider.enableEditTextForm(false);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          provider.enableEditTextForm(true);

                          print("add to firebase");
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
