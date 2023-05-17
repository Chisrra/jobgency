import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/servicesPrototype/service_finished.dart';
import 'package:frontend/servicesPrototype/service_in_progress.dart';
import 'package:frontend/widgets/wrench_animated.dart';

import '../widgets/progress_bar_service.dart';

class ServiceInProgress extends StatefulWidget {
  ServiceInProgress({Key? key}) : super(key: key);

  @override
  State<ServiceInProgress> createState() => _ServiceInProgressState();
}

class _ServiceInProgressState extends State<ServiceInProgress> {
  startTimer() {
    Timer(const Duration(seconds: 10), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const ServiceFinished()));
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
              "Servicio en progreso",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 78, 121, 186)),
            ),
            SizedBox(
              height: 30,
            ),
            AnimatedWrench(),
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
