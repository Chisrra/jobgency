import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/authentication/signup_screen.dart';

import '../global/global.dart';
import '../splashScreens/splash_screen.dart';
import '../widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (!emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "El correo electronico no es valido.");
    } else if (passwordTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "La contraseña es requerida.");
    } else {
      loginUserNow();
    }
  }

  loginUserNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Procesando, Porfavor espere...",
          );
        });

    final User? firebaseUser = (await fAuth
            .signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: " + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      DatabaseReference usersRef =
          FirebaseDatabase.instance.ref().child("users");
      usersRef.child(firebaseUser.uid).once().then((usersKey) {
        final snapShot = usersKey.snapshot;
        if (snapShot.value != null) {
          currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Login exitoso");
          // ignore: use_build_context_synchronously
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => MySplashScreen()));
        } else {
          Fluttertoast.showToast(msg: "No existe historial de este ingreso");
          fAuth.signOut();
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => MySplashScreen()));
        }
      });
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Ocurrió un error durante el login, vuelva a intentar.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        Text(
                          "Welcome to",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "JobGency",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Ingresa a JobGency",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: passwordTextEditingController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    hintText: "Contraseña",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    validateForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 78, 121, 186),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  child: const Text(
                    "No tienes cuenta aún? Registrate aquí!",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => SignUpScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
