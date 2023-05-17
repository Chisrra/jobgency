import 'package:flutter/material.dart';
import 'package:frontend/splashScreens/splash_screen.dart';
import 'package:frontend/widgets/appbar/app_bar_title.dart';

class ServiceFinished extends StatelessWidget {
  const ServiceFinished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBarTitle(title: "JobGency"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SERVICIO COMPLETO",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 78, 121, 186)),
            ),
            Text(
              '"Gracias por elegir Fontanería Don Mauricio!"',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => MySplashScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 121, 186),
              ),
              child: const Text(
                "Finalizar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "JobGency",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
