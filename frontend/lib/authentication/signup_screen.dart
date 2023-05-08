import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import '../global/global.dart';
import '../splashScreens/splash_screen.dart';
import '../widgets/progress_dialog.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

final TextEditingController _dateController = TextEditingController();
final _dateFormat = DateFormat('dd/MM/yyyy');

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController maternLastNameTextEditingController =
      TextEditingController();
  TextEditingController paternLastNameTextEditingController =
      TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController streetNameTextEditingController =
      TextEditingController();
  TextEditingController cpTextEditingController = TextEditingController();
  TextEditingController extNumberTextEditingController =
      TextEditingController();
  TextEditingController intNumberTextEditingController =
      TextEditingController();
  TextEditingController stateTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: "El nombre debe contener al menos 3 letras");
    } else if (paternLastNameTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "El apellido paterno no puede estar vacío");
    } else if (maternLastNameTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "El apellido materno no puede estar vacío");
    } else if (ageTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Ingrese una edad");
    } else if (_dateController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Ingrese una fecha de nacimiento");
    } else if (streetNameTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Ingrese la calle en la que vive");
    } else if (extNumberTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Ingrese el numero exterior");
    } else if (cpTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Ingrese el codigo postal");
    } else if (stateTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Ingrese un estado");
    } else if (!emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Dirección de email no valida");
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "El telefono es obligatorio");
    } else if (passwordTextEditingController.text.length < 6) {
      Fluttertoast.showToast(
          msg: "La contraseña debe tener al menos 6 caracteres");
    } else if (passwordTextEditingController.text !=
        confirmPasswordTextEditingController.text) {
      Fluttertoast.showToast(msg: "No coincide la contraseña");
    } else {
      saveUserInfoNow();
    }
  }

  saveUserInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Procesando, favor de esperar...",
          );
        });

    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: " + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      Map userMap = {
        "id": firebaseUser.uid,
        "name": nameTextEditingController.text.trim(),
        "paternLastName": paternLastNameTextEditingController.text.trim(),
        "maternLastName": maternLastNameTextEditingController.text.trim(),
        "age": ageTextEditingController.text.trim(),
        "bornDate": _dateController.text.trim(),
        "street": streetNameTextEditingController.text.trim(),
        "extNumber": extNumberTextEditingController.text.trim(),
        "intNumber": intNumberTextEditingController.text.trim(),
        "cp": cpTextEditingController.text.trim(),
        "state": stateTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };

      DatabaseReference driversRef =
          FirebaseDatabase.instance.ref().child("users");
      driversRef.child(firebaseUser.uid).set(userMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Cuenta creada.");
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => MySplashScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "La cuenta no fue creada.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Registro a JobGency",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: nameTextEditingController,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  hintText: "Nombre",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: paternLastNameTextEditingController,
                decoration: const InputDecoration(
                  labelText: "Apellido paterno",
                  hintText: "Apellido paterno",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: maternLastNameTextEditingController,
                decoration: const InputDecoration(
                  labelText: "Apellido Materno",
                  hintText: "Apellido Materno",
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
              TextField(
                keyboardType: TextInputType.number,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: ageTextEditingController,
                decoration: const InputDecoration(
                  labelText: "Edad",
                  hintText: "Edad",
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
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: _dateController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today),
                  labelText: "Fecha de nacimiento",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(DateTime.now().year + 1));
                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text =
                          (_dateFormat.format(pickedDate)).toString();
                    });
                  } else {
                    print("No se selecciono nada");
                  }
                },
              ),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: streetNameTextEditingController,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  labelText: "Dirección (Calle)",
                  hintText: "Dirección (Calle)",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: extNumberTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Num. Ext",
                  hintText: "Num. Ext",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: intNumberTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Num. Int",
                  hintText: "Num. Int",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: cpTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Codigo Postal",
                  hintText: "Codigo Postal",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: stateTextEditingController,
                decoration: const InputDecoration(
                  labelText: "Estado",
                  hintText: "Estado",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Telefono",
                  hintText: "Telefono",
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
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
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: confirmPasswordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirmar Contraseña",
                  hintText: "Confirmar Contraseña",
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
                    backgroundColor: Color.fromARGB(255, 78, 121, 186)),
                child: const Text(
                  "Registrar cuenta",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                child: const Text(
                  "Ya tienes una cuenta? Ingresa Aquí!",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
