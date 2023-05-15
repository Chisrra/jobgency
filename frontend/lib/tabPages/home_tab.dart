import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar/app_bar_title.dart';
import 'package:frontend/widgets/custom_service_card.dart';

import '../servicesPages/plumbing_page.dart';
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
      appBar: const AppBarTitle(
        title: 'JobGency',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Servicios que puedes contratar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 230,
              child: Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2,
                  crossAxisCount: 2, // Número de columnas
                  shrinkWrap: true,
                  children: [
                    ServiceCard(
                      onTap: () {},
                      title: "Comida",
                      subTitle: "Servicios de comida a domicilio",
                      icon: const Icon(Icons.fastfood_outlined),
                    ),
                    ServiceCard(
                      onTap: () {},
                      title: "Hogar",
                      subTitle: "Servicios para el hogar",
                      icon: const Icon(Icons.home),
                    ),
                    ServiceCard(
                      onTap: () {},
                      title: "Especializado",
                      subTitle: "Servicios en areas especializadas",
                      icon: const Icon(Icons.miscellaneous_services_outlined),
                    ),
                    ServiceCard(
                      onTap: () {},
                      title: "Educación",
                      subTitle: "Servicios de educación",
                      icon: const Icon(Icons.school),
                    ),
                  ],
                ),
              ),
            ),
            //HOGAR
            const SizedBox(
              height: 20,
            ),
            const Text(
              "HOGAR",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomServiceCard(
                image: "assets/images/fontaneria.jpg",
                subTitle: "Servicios de fontanería",
                title: "Fontanería",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => PlumbingServicePage()));
                }),
            CustomServiceCard(
                image: "assets/images/jardineria.jpg",
                subTitle: "Servicios de jardinería",
                title: "Jardinería",
                onTap: () {}),
            CustomServiceCard(
                image: "assets/images/limpieza.jpg",
                subTitle: "Servicios de limpieza",
                title: "Limpieza",
                onTap: () {}),
            CustomServiceCard(
                image: "assets/images/pintura.jpg",
                subTitle: "Servicios de pintura",
                title: "Pintura",
                onTap: () {}),
            //SECCIÓN DE SERVICIOS
            const Text(
              "PROXIMAMENTE MÁS...",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
