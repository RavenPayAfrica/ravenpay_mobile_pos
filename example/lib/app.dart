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
                          appInfo: AppInfo(
                            appName: 'Raven Bank',
                            appId: '344ac4a97a8ec9e58b041099e5386851',
                          ),
                          customerInfo: CustomerInfo(
                            lastName: 'Jay',
                            firstName: 'Obinna',
                            bvn: '1234567890',
                            email: 'me@you.com',
                            phone: '00000000',
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
