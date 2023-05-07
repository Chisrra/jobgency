import 'dart:async';
import 'package:flutter/material.dart';

import '../assistants/assistant_methods.dart';
import '../authentication/login_screen.dart';
import '../global/global.dart';
import '../mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    fAuth.currentUser != null
        ? AssistantMethods.readCurrentOnlineUserInfo()
        : null;
    Timer(const Duration(seconds: 3), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MainScreen()));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Welcome to",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Text(
                "JobGency",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
