import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class ViewTerminalInfo extends StatefulWidget {
  const ViewTerminalInfo({super.key});

  @override
  State<ViewTerminalInfo> createState() => _ViewTerminalInfoState();
}

class _ViewTerminalInfoState extends State<ViewTerminalInfo> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        body: SingleChildScrollView(
      child: Column(children: const []),
    ));
  }
}
