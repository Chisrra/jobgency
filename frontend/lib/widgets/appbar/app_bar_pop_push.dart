import 'package:flutter/material.dart';

class AppBarPopPush extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final String pushNameRout;
  const AppBarPopPush({super.key, required this.title, required this.pushNameRout});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_sharp),
        onPressed: () => Navigator.popAndPushNamed(context, pushNameRout),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        ),
      backgroundColor: const Color(0xFF0476d9),
    );
  }

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}