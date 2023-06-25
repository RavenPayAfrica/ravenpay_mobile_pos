import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/raven_pay_fab.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/request_pos/request_terminal_1.dart';
import 'package:mobile_pos/src/views/request_pos/widget/request_item.dart';

class RequestTerminalIndex extends StatefulWidget {
  const RequestTerminalIndex({super.key});

  @override
  State<RequestTerminalIndex> createState() => _RequestTerminalIndexState();
}

class _RequestTerminalIndexState extends State<RequestTerminalIndex> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        fab: RavenPayFab(
          onPressed: () {
            pushRoute(context, const RequestTerminal1());
          },
          widget: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.add, color: pluginTheme.onPrimary),
            const Gap(2),
            Text(
              "Request Terminal",
              style:
                  subtitle.copyWith(fontSize: 14, color: pluginTheme.onPrimary),
            ),
          ]),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(children: [
            const Gap(24),
            const RavenPayCloseButton(
              text: "Back",
              isArrow: true,
            ),
            const Gap(24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "All Terminals",
                style: headling1,
              ),
            ),
            const Gap(16),
            Text(
                "Manage all your terminals here, request, edit and track all at the same time.",
                style: subtitle2.copyWith(fontSize: 14)),
            const Gap(28),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return const RequestItem();
              }),
            )
          ]),
        ));
  }
}
