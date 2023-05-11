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
        print("Name = ${userModelCurrentInfo!.name}");
        print("Email = ${userModelCurrentInfo!.email}");
        print("Phone= ${userModelCurrentInfo!.phone}");
        print("Patern LN= ${userModelCurrentInfo!.paternLastName}");
        print("Matern LN= ${userModelCurrentInfo!.maternLastName}");
      }
    });
  }
}
