import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? phone;
  String? name;
  String? paternLastName;
  String? maternLastName;
  String? streetName;
  String? extNumber;
  String? intNumber;
  String? state;
  String? cp;
  String? id;
  String? bornDate;
  String? email;
  UserModel({this.phone, this.name, this.id, this.email});

  UserModel.fromSnapshot(DataSnapshot snap) {
    maternLastName = (snap.value as dynamic)["maternLastName"];
    paternLastName = (snap.value as dynamic)["paternLastName"];
    streetName = (snap.value as dynamic)["street"];
    extNumber = (snap.value as dynamic)["extNumber"];
    intNumber = (snap.value as dynamic)["intNumber"];
    state = (snap.value as dynamic)["state"];
    phone = (snap.value as dynamic)["phone"];
    name = (snap.value as dynamic)["name"];
    bornDate = (snap.value as dynamic)["bornDate"];
    id = (snap.key);
    email = (snap.value as dynamic)["email"];
  }
}
