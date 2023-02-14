import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zewin/model/whatappModel.dart';
import 'package:zewin/provider/provider.dart';
import 'package:zewin/sheard/remote/firbaseUtilis.dart';

class Setting_Screen extends StatelessWidget {
  Setting_Screen({Key? key}) : super(key: key);
  static const String routeName = "setting";

  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
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
                  maxLength: 500,
                  textDirection: TextDirection.rtl,
                  controller: provider.descriptionController,
                  maxLines: 6,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    labelText:"ZEWIN" ,
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
                  enabled:provider.enabelEdit ,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                  ),
                    onPressed: (){
                    WhatsData whatsData=WhatsData(description: provider.descriptionController.text);
                      print("add to firebase");
                      provider.enableEditTextForm(false);
                    },
                    child: Text("Save",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                    ),
                    onPressed: (){
                     provider.enableEditTextForm(true);
                      WhatsData whatsData=WhatsData(description: provider.descriptionController.text);
                      addWhatsToFirestore(whatsData);
                      print("add to firebase");
                    },
                    child: Text("Edit",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
