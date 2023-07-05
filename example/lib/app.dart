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
                          theme: const MobilePOSTheme(
                              headerTextColor: Color(0xFF755AE2),
                              primaryColor: Color(0xFF755AE2),
                              onPrimary: Colors.white,
                              secondaryColor: Color(0xFFEA872D)),
                          enviroment: RavenMobilePOSEnviroment.staging,
                          appInfo: AppInfo(
                            appName: 'Raven',
                            appId: '89dca95cee33f4d965172740a323112',
                            appEmail: 'ravenofficial@gmail.com'
                          ),
                          customerInfo: CustomerInfo(
                            lastName: 'Nnodim',
                            firstName: 'Prisca',
                            bvn: '6386487383',
                            email: 'okere@gmail.com',
                            phone: '08166106863',
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
