import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService with ChangeNotifier {
  final String uid;

  DatabaseService({required this.uid});
  //collection reference
  CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strenght': strength,
    });
  }

  // brew list from snapshot
  // List<Brew> brews = [];
  // late Brew brew;
  // getBrews() async {
  //   List<Brew> newList = [];
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection("brews").get();
  //   snapshot.docs.forEach((doc) {
  //     brew = Brew(
  //         name: doc.get('name'),
  //         strength: doc.get('strenght'),
  //         sugars: doc.get('sugars'));
  //     newList.add(brew);
  //   });
  //   brews = newList;
  //   notifyListeners();
  // }

  // List<Brew> get brewsList {
  //   return brews;
  // }
  // List<Brew> _brewsFromSnapshot(QuerySnapshot snapshot) {
  //   List<Brew> list = snapshot.docs.map((doc) {
  //     return Brew(
  //         name: doc.get('name'),
  //         strength: int.parse(doc.get('strength').toString()),
  //         sugars: doc.get('sugars').toString());
  //   }).toList();
  //   return list;
  // }

  // // get brews stream
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots().map(_brewsFromSnapshot);
  // }
}
