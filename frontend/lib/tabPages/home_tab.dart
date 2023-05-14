import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar/app_bar_title.dart';

import '../widgets/service_card.dart';

class HomeTabPage extends StatefulWidget {
  HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle(
        title: 'Servicios',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "¿Qué servicio deseas contratar?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              child: Expanded(
                child: GridView.count(
                  childAspectRatio: 2,
                  crossAxisCount: 2, // Número de columnas
                  shrinkWrap: true,
                  children: [
                    ServiceCard(
                      onTap: () {},
                      title: "Comida",
                      subTitle: "Servicios de comida a domicilio",
                      icon: Icon(Icons.fastfood_outlined),
                    ),
                    ServiceCard(
                      onTap: () {},
                      title: "Hogar",
                      subTitle: "Servicios para el hogar",
                      icon: Icon(Icons.home),
                    ),
                    ServiceCard(
                      onTap: () {},
                      title: "Especializado",
                      subTitle: "Servicios en areas especializadas",
                      icon: Icon(Icons.miscellaneous_services_outlined),
                    ),
                    ServiceCard(
                      onTap: () {},
                      title: "Educación",
                      subTitle: "Servicios de educación",
                      icon: Icon(Icons.school),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 20,
            ),
            //SECCIÓN DE SERVICIOS
          ],
        ),
      ),
    );
  }
}
