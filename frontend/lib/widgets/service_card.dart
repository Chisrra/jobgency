import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String? image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final Icon icon;

  const ServiceCard({
    Key? key,
    this.image,
    required this.icon,
    required this.subTitle,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 145, 224, 242),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: icon,
              title: Text(title),
              subtitle: Text(subTitle),
            ),
          ],
        ),
      ),
    );
  }
}
