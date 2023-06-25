import 'package:flutter/material.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class TerminalStatus extends StatefulWidget {
  const TerminalStatus({super.key});

  @override
  State<TerminalStatus> createState() => _TerminalStatusState();
}

class _TerminalStatusState extends State<TerminalStatus> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        body: SingleChildScrollView(
      child: Column(children: const []),
    ));
  }
}
