import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/raven_pay_appbar.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_textfeild.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class UpateTerminalInfo extends StatefulWidget {
  const UpateTerminalInfo({super.key});

  @override
  State<UpateTerminalInfo> createState() => _UpateTerminalInfoState();
}

class _UpateTerminalInfoState extends State<UpateTerminalInfo> {
  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RavenPayButton(
                buttonText: "Save Information",
                onPressed: () {},
              ),
              const Gap(24),
              const PoweredByRaven(fontSize: 9),
              const Gap(24),
            ],
          ),
        ),
        appBar: ravenPayAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(
            children: [
              const Gap(12),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Business Information", style: headling1)),
              const Gap(8),
              Text(
                "We need this information before you can proceed with your terminal request.",
                style: subtitle2,
              ),
              const Gap(16),
              const RavenPayTextField(
                labelText: "Business Name",
                hintText: "Enter a business name.",
              ),
              const Gap(16),
              const RavenPayTextField(
                labelText: "Business Address",
                hintText: "Enter a business address.",
              ),
              const Gap(16),
              const RavenPayTextField(
                isDropdown: true,
                labelText: "Business Type",
                hintText: "Enter a business name.",
              ),
              const Gap(16),
              const RavenPayTextField(
                labelText: "NIN Details",
                hintText: "Enter NIN here",
              ),
            ],
          ),
        ));
  }
}
