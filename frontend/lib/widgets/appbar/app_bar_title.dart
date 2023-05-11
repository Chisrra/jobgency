import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const AppBarTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 28.0,
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