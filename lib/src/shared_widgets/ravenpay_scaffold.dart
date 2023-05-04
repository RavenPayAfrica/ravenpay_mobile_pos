import 'package:flutter/material.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';

class RavenPayScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool showLogo;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  const RavenPayScaffold(
      {super.key,
      required this.body,
      this.showLogo = false,
      this.backgroundColor,
      this.bottomSheet,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(child: body),
          bottomSheet: showLogo
              ? const PoweredByRaven(
                  fontSize: 9,
                  paddingBottom: 24,
                )
              : bottomSheet,
          bottomNavigationBar: bottomNavigationBar),
    );
  }
}
