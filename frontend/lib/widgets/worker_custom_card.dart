import 'package:flutter/material.dart';

class CustomWorkerServiceCard extends StatelessWidget {
  final String? image;
  final String title;
  final String subTitle;
  final String? score;
  final VoidCallback onTap;
  final Icon? icon;

  const CustomWorkerServiceCard({
    Key? key,
    this.score,
    this.image,
    this.icon,
    required this.subTitle,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      margin: EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(image ?? "assets/images/user.jpg",
                fit: BoxFit.cover),
            height: 200,
            width: double.infinity,
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(subTitle),
          ),
          const Text("Calificación"),
          Text(
            score ?? "No ha dado servicios aún",
            style: const TextStyle(color: Colors.grey),
          ),
          Divider(
            thickness: 2,
          ),
          TextButton(
            onPressed: (onTap),
            child: const Text(
              "Más información",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
