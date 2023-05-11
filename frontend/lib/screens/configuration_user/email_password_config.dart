import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';

class EmailPasswordConfig extends StatelessWidget {
  const EmailPasswordConfig({super.key});

  static const routeEmailChange = "/email_change";
  static const routePasswordChange = '/password_change';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarReturn(title: "Correo/Contraseña"),
      body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.email, size: 40,),
              title: Text("Correo", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),),
              shape: const Border(
                top: BorderSide(width: 1, color: Colors.black),
                bottom: BorderSide(width: 1, color: Colors.black),
              ),
              onTap: () => Navigator.pushNamed(context, routeEmailChange),
            ),

            ListTile(
              leading: const Icon(Icons.remove_red_eye, size: 40,),
              title: Text("Cambiar contraseña", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),),
              shape: const Border(
                bottom: BorderSide(width: 1, color: Colors.black,)
              ),
              onTap: () => Navigator.pushNamed(context, routePasswordChange),
            ),
          ],
        ),
      ),
      ),
    );
  }
}