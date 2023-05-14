import 'package:flutter/material.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';

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
                onPressed: () async {
                  await RavenMobilePOS.launch(context,
                      config: RavenMobilePOSConfig(onSuccess: (data) {
                        print(data);
                      }, onError: (error) {
                        print(error.message);
                      }));
                },
                child: const Text("Start Payment"))));
  }
}
