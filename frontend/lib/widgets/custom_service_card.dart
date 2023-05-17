import 'package:flutter/material.dart';

class CustomServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const CustomServiceCard({
    Key? key,
    required this.image,
    required this.subTitle,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(1),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(title),
              subtitle: Text(subTitle),
            ),
          ],
        ),
      ),
    );
  }
}
