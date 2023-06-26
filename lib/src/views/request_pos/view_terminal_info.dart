import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/request_pos/edit_terminal_info.dart';

class ViewTerminalInfo extends StatefulWidget {
  const ViewTerminalInfo({super.key});

  @override
  State<ViewTerminalInfo> createState() => _ViewTerminalInfoState();
}

class _ViewTerminalInfoState extends State<ViewTerminalInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RavenPayScaffold(
        showLogo: true,
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
            child: Row(
              children: [
                RavenPayCloseButton(
                  color: pluginTheme.onPrimary,
                  text: "Back",
                  isArrow: true,
                ),
                const Spacer(),
                Icon(Icons.more_vert, color: pluginTheme.onPrimary)
              ],
            ),
          ),
          backgroundColor: pluginTheme.primaryColor,
          elevation: 0,
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
            color: pluginTheme.primaryColor,
            height: size.height * 0.25,
            width: double.infinity,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Elatech Solution 1",
                              style: headling1.copyWith(
                                  color: pluginTheme.onPrimary)),
                          Text("View terminal information",
                              style: subtitle2.copyWith(
                                  fontSize: 13,
                                  color:
                                      pluginTheme.onPrimary.withOpacity(0.7)))
                        ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      pushRoute(context, const EditTerminalInfo());
                    },
                    child: Image.asset(
                      loadAsset("edit_icon.png"),
                      height: 34,
                    ),
                  )
                ],
              ),
              const Gap(24)
            ]),
          ),
          const Gap(28),
          Expanded(
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Terminal Balance",
                        style: subtitle2.copyWith(fontSize: 13),
                      ),
                      const Gap(4),
                      Text("NGN 650,230.00",
                          style: headling2.copyWith(
                              fontSize: 20, color: AppColors.ravenDark)),
                      const Gap(8),
                      const Divider(),
                      const Gap(12),
                      Text(
                        "Serial Number",
                        style: subtitle2.copyWith(fontSize: 13),
                      ),
                      const Gap(4),
                      Text("56255145645255435664353",
                          style: headling2.copyWith(
                              color: AppColors.ravenDark, fontSize: 14)),
                      const Gap(16),
                      Text(
                        "Terminal ID",
                        style: subtitle2.copyWith(fontSize: 13),
                      ),
                      const Gap(4),
                      Text("56255145645255435664353",
                          style: headling2.copyWith(
                              color: AppColors.ravenDark, fontSize: 14)),
                      const Gap(12),
                      const Divider()
                    ]),
              ),
            ),
          )
        ]));
  }
}
