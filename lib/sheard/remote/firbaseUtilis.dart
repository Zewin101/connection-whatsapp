import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../model/whatappModel.dart';

CollectionReference<WhatsData> getWhatsCollection() {
  return FirebaseFirestore.instance
      .collection(WhatsData.COLLESTION_DATA)
      .withConverter<WhatsData>(
        fromFirestore: (snapshot, options) =>
            WhatsData.fromJson(snapshot.data()!),
        toFirestore: (whats, options) => whats.toJson(),
      );
}

Future<void>addData(WhatsData whatsData) async {

  var getWhatCollection = await getWhatsCollection();
 var docRef=getWhatCollection.doc();
  whatsData.id=docRef.id;
  docRef.set(whatsData);
}
