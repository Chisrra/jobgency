import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar/app_bar_title.dart';

import '../../global/global.dart';
import '../../splashScreens/splash_screen.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  static const routeEditPersonalData = '/edit_personal_data';
  static const routeEmailPasswordConfig = '/email_password_config';

  @override
  Widget build(BuildContext context) {
    String urlImageUser = '';

    return Scaffold(
      appBar: const AppBarTitle(title: "Configuración"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                      child: urlImageUser == ''
                          ? const FittedBox(
                              child: Icon(
                                Icons.account_circle_rounded,
                                color: Colors.grey,
                              ),
                            )
                          : Image.network(
                              urlImageUser,
                              fit: BoxFit.cover,
                            ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              //IMPRIMIMOS EL NOMBRE DEL USUARIO ACTUAL A PARTIR DE LOS DATOS RECOPILADOS
              Text(
                "${userModelCurrentInfo!.name} ${userModelCurrentInfo!.paternLastName} ${userModelCurrentInfo!.maternLastName}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit_rounded),
                    title: const Text("Editar Perfil"),
                    shape: const Border(
                      top: BorderSide(width: 1, color: Colors.black),
                      bottom: BorderSide(width: 1, color: Colors.black),
                    ),
                    onTap: () => Navigator.pushNamed(context, routeEditPersonalData),
                  ),
                  ListTile(
                    leading: const Icon(Icons.alternate_email),
                    title: const Text("Correo/Contraseña"),
                    shape: const Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                    onTap: () => Navigator.pushNamed(context, routeEmailPasswordConfig),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.wallet,
                    ),
                    title: const Text("Método de pago"),
                    shape: const Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                    onTap: () => print("Método de pago"),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.history,
                    ),
                    title: const Text("Historial"),
                    shape: const Border(
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
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(232, 244, 86, 54),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      fAuth.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => MySplashScreen()));
                    },
                    child: const Text("Cerrar sesión"),
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
