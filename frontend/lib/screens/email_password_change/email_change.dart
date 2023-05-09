import 'package:flutter/material.dart';
import 'package:frontend/global/global.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';

class EmailChange extends StatefulWidget {
  const EmailChange({super.key});

  @override
  State<EmailChange> createState() => _EmailChange();
}

class _EmailChange extends State<EmailChange> {
  final _fromKey = GlobalKey<FormState>();
  List<String> correos = [
    userModelCurrentInfo!.email ?? "_Error inesperado_",
    "correo_1_@homtail.com",
    "correo_2_@homtail.com",
    "correo_3_@homtail.com",
    "correo_4_@homtail.com",
    "correo_5_@homtail.com"
  ];

  //Controladores de los TextFormField
  TextEditingController _fieldControllerAgregarCorreo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarReturn(title: "Modificar correo"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _fromKey,
            child: ListView(
              children: [
                //Correo principal
                Text('Correo principal',
                    style: Theme.of(context).textTheme.titleLarge),

                DropdownButtonFormField(
                  value: correos[0],
                  items: correos.map((correo) {
                    return DropdownMenuItem(
                      value: correo,
                      child: Text(correo),
                    );
                  }).toList(),
                  onChanged: (correo) {
                    print(correo);
                  },
                ),

                const SizedBox(height: 26),

                //Correos secundarios
                Text(
                  'Correos secundarios',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ...correos.asMap().entries.map((entry) {
                  final index = entry.key;
                  final correo = entry.value;
                  if (index == 0) {
                    return const SizedBox.shrink();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.emailAddress,
                              initialValue: correo,
                              decoration: InputDecoration(
                                labelText: "Correo secundario $index",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                correos.removeAt(index);
                              });
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }).toList(),

                const SizedBox(height: 26),

                //Agregar correo secundario
                Text("Agregar correo secundario", style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _fieldControllerAgregarCorreo,
                        decoration: const InputDecoration(
                          labelText: "Agregar correo",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          correos.add(_fieldControllerAgregarCorreo.text);
                          _fieldControllerAgregarCorreo.clear();
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline,
                        color:Colors.green,
                        size:30
                      ),

                    )
                  ],
                ),
                const SizedBox(height: 26),

                //Guardar cambios
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {print(correos.toString());},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E79BA),
                      padding: EdgeInsets.all(15.0)
                    ),
                    child: Text("Guardar cambios", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
