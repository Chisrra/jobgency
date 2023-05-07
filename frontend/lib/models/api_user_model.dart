import 'package:firebase_database/firebase_database.dart';

class APIUserModel {
  String? id;
  APIUserModel({this.id});
  APIUserModel.fromSnapshot(DataSnapshot snap) {
    id = (snap.value as dynamic)["id"];
  }
}