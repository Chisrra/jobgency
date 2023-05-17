import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';
import 'package:frontend/widgets/worker_custom_card.dart';

import '../servicesPrototype/don_mauricio_service.dart';

class PlumbingServicePage extends StatefulWidget {
  PlumbingServicePage({Key? key}) : super(key: key);

  @override
  State<PlumbingServicePage> createState() => _PlumbingServicePageState();
}

class _PlumbingServicePageState extends State<PlumbingServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReturn(title: "Fontanería"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomWorkerServiceCard(
                subTitle:
                    "En fontanerías Don Mauricio, estamos comprometidos con realizar trabajos de calidad",
                title: "Fontanería Don Mauricio",
                image: "assets/images/donmauricio.jpg",
                score: "9.5/10",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => DonMauricio()))),
            CustomWorkerServiceCard(
                subTitle: "Especialista en reparaciones desde 2002",
                title: "Fontanería Salix",
                image: "assets/images/fontaneromex.jpg",
                onTap: () {
                  Fluttertoast.showToast(msg: "No disponible por el momento");
                }),
          ],
        ),
      ),
    );
  }
}
