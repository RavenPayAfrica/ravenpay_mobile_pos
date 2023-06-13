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
                      config: RavenMobilePOSConfig(
                          theme: MobilePOSTheme(
                              headerTextColor: Color(0xFF755AE2),
                              primaryColor: Color(0xFF755AE2),
                              onPrimary: Colors.white,
                              secondaryColor: Color(0xFFEA872D)),
                          enviroment: RavenMobilePOSEnviroment.staging,
                          businessInfo: BusinessInfo(
                            businessName: 'Raven Bank',
                            // logo: Image.asset(
                            //   'assets/logo.png',
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          onSuccess: (data) {
                            print(data);
                          },
                          onError: (error) {
                            print(error.message);
                          }));
                },
                child: const Text("Start Payment"))));
  }
}
