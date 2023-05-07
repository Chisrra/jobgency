import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';

import '../../global/global.dart';
import '../../splashScreens/splash_screen.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    String url_image_user = '';

    return Scaffold(
      appBar: AppBarReturn(title: "Configuración"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: url_image_user == ''
                          ? FittedBox(
                              child: const Icon(
                                Icons.account_circle_rounded,
                                color: Colors.grey,
                              ),
                            )
                          : Image.network(
                              url_image_user,
                              fit: BoxFit.cover,
                            ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              //IMPRIMIMOS EL NOMBRE DEL USUARIO ACTUAL A PARTIR DE LOS DATOS RECOPILADOS
              Text(
                userModelCurrentInfo!.name.toString() +
                    " " +
                    userModelCurrentInfo!.paternLastName.toString() +
                    " " +
                    userModelCurrentInfo!.maternLastName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit_rounded),
                    title: Text("Editar Perfil"),
                    shape: Border(
                      top: BorderSide(width: 1, color: Colors.black),
                      bottom: BorderSide(width: 1, color: Colors.black),
                    ),
                    onTap: () => print("Editar perfil toque"),
                  ),
                  ListTile(
                    leading: Icon(Icons.alternate_email),
                    title: Text("Correo/Contraseña"),
                    shape: Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                    onTap: () => print("Correo/Contraseña"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.wallet,
                    ),
                    title: Text("Método de pago"),
                    shape: Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                    onTap: () => print("Método de pago"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                    ),
                    title: Text("Historial"),
                    shape: Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                    onTap: () => print("Historial"),
                  ),
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: DottedBorder(
                  color: Colors.red,
                  dashPattern: const [6, 3, 2, 3],
                  strokeWidth: 1,
                  child: ElevatedButton(
                    child: Text("Cerrar sesión"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(232, 244, 86, 54),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      fAuth.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => MySplashScreen()));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
