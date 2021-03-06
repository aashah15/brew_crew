import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BrewsProvider with ChangeNotifier {
  List<Brew> brews = [];
  late Brew brew;
  getBrews() async {
    List<Brew> newList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("brews").get();
    snapshot.docs.forEach((doc) {
      brew = Brew(
          name: doc.get('name'),
          strength: doc.get('strenght'),
          sugars: doc.get('sugars'));
      newList.add(brew);
    });
    brews = newList;
    notifyListeners();
  }

  List<Brew> get brewsList {
    return brews;
  }
}
