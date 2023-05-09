import 'package:flutter/material.dart';
import 'package:frontend/global/global.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarReturn(title: "Datos personales"),
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
                initialValue: _userData!.maternLastName,
                decoration: const InputDecoration(labelText: "Apellido Materno"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese su apellido paterno";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _userData!.maternLastName = newValue!;
                },
              ),

              //Edad
              /*  TextFormField(
                decoration: InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su edad';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor ingrese un número válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userData!.edad = int.parse(value!);
                },
              ), */

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
              ),

              //Calle
              TextFormField(
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(labelText: "Calle"),
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

              //Número exterior y interior
              Row(
                children: [
                  //Ext.
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Num. Ext."),
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
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  //Ext.
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Num. Int."),
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
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              //CP y Estado
              Row(
                children: [
                  //Ext.
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Codigo postal"),
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
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  //Ext.
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Estado"),
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
                  ),
                ],
              ),

              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Número de celular"),
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
                onPressed: () {},
                child: const Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
