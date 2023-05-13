import 'package:flutter/material.dart';
import 'package:mobile_pos/mobile_pos.dart';

class RavenPayExampleApp extends StatefulWidget {
  const RavenPayExampleApp({super.key});

  @override
  State<RavenPayExampleApp> createState() => _RavenPayExampleAppState();
}

class _RavenPayExampleAppState extends State<RavenPayExampleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  MobilePos.startRavenPay(context);
                },
                child: const Text("Start Payment"))));
  }
}
