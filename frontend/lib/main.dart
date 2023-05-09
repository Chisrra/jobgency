import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/configuration_user/email_password_config.dart';
import 'package:frontend/screens/configuration_user/user_edit_personal_data.dart';
import 'package:frontend/screens/configuration_user/user_settings_screen.dart';
import 'package:frontend/screens/email_password_change/email_change.dart';
import 'package:frontend/splashScreens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'infoHandler/app_info.dart';
import 'mainScreens/main_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
      child: ChangeNotifierProvider(
    create: (context) => AppInfo(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
      routes: {
        '/home' : (context) => MainScreen(),
        '/user_settings' : (context) => const UserSettingsScreen(),
        '/edit_personal_data' :(context) => const EditPersonalData(),
        '/email_password_config' :(context) => const EmailPasswordConfig(),
        '/email_change' : (context) => const EmailChange(),
      },
    ),
  )));
}

class MyApp extends StatefulWidget {
  final Widget? child;
  MyApp({this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      child: widget.child!,
    );
  }
}
