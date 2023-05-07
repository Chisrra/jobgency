import 'package:flutter/material.dart';

class CustomUserDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  CustomUserDrawer({super.key, required this.sKey});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 36,
        left: 30,
        child: GestureDetector(
          onTap: () {
            sKey.currentState!.openDrawer();
          },
          child: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ));
  }
}
