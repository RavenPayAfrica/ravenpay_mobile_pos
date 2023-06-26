import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/network/api_requests.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/progress_dialog.dart';
import 'package:mobile_pos/src/shared_widgets/raven_pay_appbar.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_textfeild.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

import '../../helpers/helper_functions.dart';
import 'request_terminal_1.dart';

class UpdateUserInfo extends StatefulWidget {
  const UpdateUserInfo({super.key});

  @override
  State<UpdateUserInfo> createState() => _UpdateUserInfoState();
}

class _UpdateUserInfoState extends State<UpdateUserInfo> {
  String? name, address, nin, desc;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                onPressed: () => updateBusiness(),
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
          child: Form(
            key: formKey,
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
                const Gap(24),
                RavenPayTextField(
                    labelText: "Business Name",
                    hintText: "Enter a business name.",
                    onSaved: (data) => name = data,
                    validator: (data) => validateInput(data,
                        errorMessage: 'Enter a valid business name')),
                const Gap(16),
                RavenPayTextField(
                    labelText: "Business Address",
                    hintText: "Enter a business address.",
                    onSaved: (data) => address = data,
                    validator: (data) => validateInput(data,
                        errorMessage: 'Enter a valid business address')),
                const Gap(16),
                RavenPayTextField(
                    labelText: "Business Description",
                    hintText: "Enter a business address.",
                    onSaved: (data) => desc = data,
                    validator: (data) => validateInput(data,
                        errorMessage: 'Enter a valid business description')),
                const Gap(16),
                RavenPayTextField(
                    labelText: "NIN Details",
                    hintText: "Enter NIN here",
                    onSaved: (data) => nin = data,
                    validator: (data) => validateInput(data,
                        errorMessage: 'Enter a valid NIN', minCount: 10)),
              ],
            ),
          ),
        ));
  }

  void updateBusiness() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) => const ProgressDialog(
                status: 'Updating info...',
              ));
      final success = await ApiRequest.updateUserDetails(
          busnessName: name ?? '',
          businessAddress: address ?? '',
          businessDescription: desc ?? '',
          nin: nin);
      Navigator.pop(context);
      if (success) {
        profileUpdate = true;
        pushRoute(context, const RequestTerminal1());
      }
    }
  }
}
