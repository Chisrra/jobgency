import 'package:flutter/material.dart';

import '../models/directions.dart';

class AppInfo extends ChangeNotifier {
  Directions? userUpdatedLocation;
  void updateUserUpdatedAddress(Directions userUpdatedAddress) {
    userUpdatedLocation = userUpdatedAddress;
    notifyListeners();
  }
}
