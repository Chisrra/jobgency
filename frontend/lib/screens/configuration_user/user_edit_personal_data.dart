import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/global/global.dart';
import 'package:frontend/widgets/appbar/app_bar_pop_push.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';
import 'package:intl/intl.dart';

class EditPersonalData extends StatefulWidget {
  const EditPersonalData({super.key});

  @override
  State<EditPersonalData> createState() => _EditPersonalData();
}

class _EditPersonalData extends State<EditPersonalData> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final _dateFormat = DateFormat('dd/MM/yyyy');
  final _userData = userModelCurrentInfo;

  @override
  void initState() {
    super.initState();
    _dateController.text = _userData!.bornDate ?? '';
  }

  void _actualizarDatos() {
    final FormState? form = _fromKey.currentState;
    if(form != null && form.validate()) {
      form.save();
      //Aqui podríamos actualizar los datos en la BD
      

      //Exito
      Fluttertoast.showToast(
        msg: "Datos actualizados con éxtio",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPopPush(title: "Datos personales", pushNameRout: '/home'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _fromKey,
          child: ListView(
            children: [
              //Nombre
              TextFormField(
                keyboardType: TextInputType.name,
                initialValue: _userData!.name,
                decoration: const InputDecoration(labelText: "Nombre"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese su nombre";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _userData!.name = newValue!;
                },
              ),

              //Apellido Paterno
              TextFormField(
                keyboardType: TextInputType.name,
                initialValue: _userData!.paternLastName,
                decoration: const InputDecoration(labelText: "Apellido Paterno"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese su apellido paterno";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _userData!.paternLastName = newValue!;
                },
              ),

              //Apellido Materno
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: _userData!.maternLastName,
                decoration: const InputDecoration(labelText: "Apellido Materno"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese su apellido materno";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _userData!.maternLastName = newValue!;
                },
              ),

              //Fecha de nacimiento
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
                onSaved: (newValue) {
                  _userData!.bornDate = newValue;
                },
              ),

              //Calle
              TextFormField(
                initialValue: _userData!.streetName,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(labelText: "Calle"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese el nombre de su calle";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _userData!.streetName = newValue!;
                },
              ),

              //Número exterior y interior
              Row(
                children: [
                  //Ext.
                  Expanded(
                    child: TextFormField(
                      initialValue: _userData!.extNumber,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: "Num. Ext."),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingrese el Num. Ext.";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _userData!.extNumber = newValue!;
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  //Int.
                  Expanded(
                    child: TextFormField(
                      initialValue: _userData!.intNumber ?? '',
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: "Num. Int."),
                      onSaved: (newValue) {
                        if (newValue == null || newValue.isEmpty) {
                          return;
                        }
                        _userData!.paternLastName = newValue;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              //CP y Estado
              Row(
                children: [
                  //CP.
                  Expanded(
                    child: TextFormField(
                      initialValue: _userData!.cp,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: "Codigo postal"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingrese su Código Postal";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _userData!.cp = newValue!;
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  //Estado.
                  Expanded(
                    child: TextFormField(
                      initialValue: _userData!.state,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: "Estado"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingrese el estado dodo reside";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _userData!.state = newValue!;
                      },
                    ),
                  ),
                ],
              ),

              TextFormField(
                initialValue: _userData!.phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Número de celular", hintText: "### ### ####"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor número celular";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _userData!.phone = newValue!;
                },
              ),

              //Espacio
              const SizedBox(
                height: 10.0,
              ),

              //Boton Saved
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4e79ba),
                  foregroundColor: const Color(0xFFFFFFFF),
                  elevation: 10.0,
                ),
                onPressed: _actualizarDatos,
                child: const Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
