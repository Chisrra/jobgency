import 'package:flutter/material.dart';
import 'package:frontend/screens/configuration_user/user_settings_screen.dart';
import '../global/global.dart';
import '../splashScreens/splash_screen.dart';

class AccountTab extends StatefulWidget {
  AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return UserSettingsScreen();
  }
}
/*
ElevatedButton(
          onPressed: () {
            fAuth.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => MySplashScreen()));
          },
          child: Text("Log out")),
*/