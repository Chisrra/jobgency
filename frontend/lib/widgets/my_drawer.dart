import 'package:flutter/material.dart';

import '../global/global.dart';
import '../splashScreens/splash_screen.dart';

class MyDrawer extends StatefulWidget {
  String? name;
  String? phone;
  MyDrawer({super.key, this.name, this.phone});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //DrawerHeader
          SizedBox(
            height: 165,
            child: DrawerHeader(
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.phone.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //DrawerBody
          GestureDetector(
            onTap: () {
              fAuth.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => MySplashScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: Text(
                "Sign out",
              ),
            ),
          )
        ],
      ),
    );
  }
}
