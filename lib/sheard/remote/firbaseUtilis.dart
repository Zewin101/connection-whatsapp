import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../model/whatappModel.dart';

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
  var docRef = getWhatCollection.doc("0104252746");
  whatsData.id=docRef.id;
  docRef.set(whatsData);
}

Future<void> updateUser(WhatsData whatsData) {
  whatsData.id=getWhatsCollection().doc("0104252746").id;
  return getWhatsCollection().doc("0104252746").update(whatsData.toJson());
}

Future<WhatsData?> readUserFromFirestore(String id)async {

  DocumentSnapshot<WhatsData> user=await getWhatsCollection().doc(id).get();
  var myUser=user.data();
  return myUser;

}