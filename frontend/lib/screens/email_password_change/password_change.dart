import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class PasswordChange extends StatefulWidget {

  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final _fromKey = GlobalKey<FormState>();

  String _currentPassword = '';

  String _newPassword = '';

  String _confirmPassword = '';

  String _hashPassword(String password) {
    if (password == '') return '';

    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  void _saveForm() {
    final FormState? form = _fromKey.currentState;
    if (form != null && form.validate()) {
      
      form.save();

      if(_newPassword != _confirmPassword) {
        Fluttertoast.showToast(
          msg: "Las contraseñas no coinciden",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER
        );
        return;
      }
      print(_currentPassword);
      print(_newPassword);
      print(_confirmPassword);


      //Validad contraseña actual
      
      //Exito
      Fluttertoast.showToast(
        msg: "Se ha cambiado la contraseña con éxito",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarReturn(
        title: "Cambiar contraseña",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //Contraseña actual
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Contraseña actual",
                  hintText: "********",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la contraseña actual';
                  }                  
                  return null;
                },
                onSaved: (value) {
                  _currentPassword = _hashPassword(value ?? '');
                },
              ),

              //Nueva contraseña
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Nueva contraseña",
                  hintText: "********",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una nueva contraseña';
                  }
                  if(value.length < 8) {
                    return 'La contraseña debe tener al menos 8 caracteres';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newPassword = _hashPassword(value ?? '');
                },
              ),

              //Confrimar contraseña
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confrimar contraseña",
                  hintText: "********",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor confirme la contraseña';
                  }
                  if(value.length < 8) {
                    return 'La contraseña debe tener al menos 8 caracteres';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = _hashPassword(value ?? '');
                },
              ),

              //Guardar
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4E79BA),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text("Confirmar", style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
