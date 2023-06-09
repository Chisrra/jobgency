import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/servicesPrototype/service_in_progress.dart';

import '../widgets/progress_bar_service.dart';

class ContratarDonMauricio extends StatefulWidget {
  ContratarDonMauricio({Key? key}) : super(key: key);

  @override
  State<ContratarDonMauricio> createState() => _ContratarDonMauricioState();
}

class _ContratarDonMauricioState extends State<ContratarDonMauricio> {
  startTimer() {
    Timer(const Duration(seconds: 10), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => ServiceInProgress()));
    });
    // ignore: use_build_context_synchronously
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tu servidor se encuentra en camino",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ProgressBar(),
            SizedBox(
              height: 100,
            ),
            Text(
              "JobGency",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
