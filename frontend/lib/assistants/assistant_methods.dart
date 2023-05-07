import 'package:firebase_database/firebase_database.dart';
import '../global/global.dart';
import '../models/user_model.dart';

class AssistantMethods {
  static void readCurrentOnlineUserInfo() async {
    currentFirebaseUser = fAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(currentFirebaseUser!.uid);
    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
        print("Name = " + userModelCurrentInfo!.name.toString());
        print("Email = " + userModelCurrentInfo!.email.toString());
        print("Phone= " + userModelCurrentInfo!.phone.toString());
        print("Patern LN= " + userModelCurrentInfo!.paternLastName.toString());
        print("Matern LN= " + userModelCurrentInfo!.maternLastName.toString());
      }
    });
  }
}
