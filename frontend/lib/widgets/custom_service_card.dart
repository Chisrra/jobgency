import 'package:flutter/material.dart';

class CustomServiceCard extends StatelessWidget {
  final String? image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final Icon icon;

  const CustomServiceCard({
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
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
