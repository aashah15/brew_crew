import 'package:cloud_firestore/cloud_firestore.dart';

class Brew {
  String? name;
  int? strength;
  String? sugars;

  Brew({this.name, this.strength, this.sugars});

  // Brew.fromJson(Map<String, dynamic> parsedJson)
  //     : name = parsedJson['name'],
  //       strength = parsedJson['strength'],
  //       sugars = parsedJson['sugars'];
  factory Brew.fromJson(Map<String, dynamic> json) => _brewFromJson(json);
  factory Brew.fromSnapshot(DocumentSnapshot snapshot) {
    final brew = Brew.fromJson(snapshot.data() as Map<String, dynamic>);
    return brew;
  }

  static Brew fromMap(Map<String, dynamic> map) {
    return Brew(
        name: map['name'], strength: map['strenght'], sugars: map['sugars']);
  }
}

Brew _brewFromJson(Map<String, dynamic> json) {
  return Brew(
      name: json['name'] as String,
      strength: json['strength'] as int,
      sugars: json['sugares'] as String);
}
