


import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/whatappModel.dart';

CollectionReference<WhatsData> getWhatsCollection() {
  return FirebaseFirestore.instance
      .collection('WhatsData')
      .withConverter<WhatsData>(
    fromFirestore: (snapshot, options) =>
        WhatsData.fromJson(snapshot.data()!),
    toFirestore: (whats, options) => whats.toJson(),
  );

}


Future<void> addWhatsToFirestore(WhatsData whatsData){
 var collection= getWhatsCollection();
 var docRef=collection.doc();
 whatsData.id=docRef.id;
return docRef.set(whatsData);
}


Future<void> updateUser(String id,WhatsData whatsData) {
  return getWhatsCollection()
      .doc(id)
      .update(whatsData.toJson())
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> DeleteWhatsToFirestore(String id){
return getWhatsCollection().doc(id).delete();
}