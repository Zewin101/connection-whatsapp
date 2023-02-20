import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../model/whatappModel.dart';
import '../../screens/loginScreen.dart';

CollectionReference users =
    FirebaseFirestore.instance.collection(WhatsData.COLLESTION_DATA);

CollectionReference<WhatsData> getWhatsCollection() {
  return FirebaseFirestore.instance
      .collection(WhatsData.COLLESTION_DATA)
      .withConverter<WhatsData>(
        fromFirestore: (snapshot, options) =>
            WhatsData.fromJson(snapshot.data()!),
        toFirestore: (whats, options) => whats.toJson(),
      );
}

Future<void> addData(WhatsData whatsData) async {
  var getWhatCollection = await getWhatsCollection();
  final userCredential = await FirebaseAuth.instance.signInAnonymously();
  var docRef = getWhatCollection.doc(userCredential.user?.uid??'');
  whatsData.id=userCredential.user?.uid??'';
  docRef.set(whatsData);
}

Future<void> updateUser(WhatsData whatsData) async{
  var userCredential = await FirebaseAuth.instance.signInAnonymously();
  whatsData.id=userCredential.user?.uid??'';
  return getWhatsCollection().doc(whatsData.id).update(whatsData.toJson());
}

Future<WhatsData?> readUserFromFirestore(String id)async {

  DocumentSnapshot<WhatsData> user=await getWhatsCollection().doc(id).get();
  var myUser=user.data();
  return myUser;

}