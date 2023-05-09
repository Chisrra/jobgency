import 'package:flutter/material.dart';
import 'package:frontend/global/global.dart';
import 'package:frontend/splashScreens/splash_screen.dart';

class HomeTabPage extends StatefulWidget {
  HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("HomeTab"),
    );
  }
}