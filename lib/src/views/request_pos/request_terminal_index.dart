import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/models/terminal_model.dart';
import 'package:mobile_pos/src/network/api_requests.dart';
import 'package:mobile_pos/src/shared_widgets/raven_pay_fab.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_button_loader.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/request_pos/request_terminal_1.dart';
import 'package:mobile_pos/src/views/request_pos/update_user_info.dart';
import 'package:mobile_pos/src/views/request_pos/widget/terminal_item.dart';

import '../../models/failure.dart';
import '../../styles/ravenpay_app_colors.dart';

class RequestTerminalIndex extends StatefulWidget {
  const RequestTerminalIndex({super.key});

  @override
  State<RequestTerminalIndex> createState() => _RequestTerminalIndexState();
}

class _RequestTerminalIndexState extends State<RequestTerminalIndex> {
  bool loading = true;
  List<Terminal> allTerminals = [];
  bool canRequestTerminal = true;

  void fetchTerminals() async {
    await ApiRequests.fetchAppInfo();
    final res = await ApiRequests.getUserTerminals();
    allTerminals.addAll(res);

    final res2 = await ApiRequests.getUserTerminalRequests();
    canRequestTerminal = res2.isEmpty;
    allTerminals.addAll(res2);
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTerminals();
  }

  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
        fab: loading
            ? SizedBox()
            : RavenPayFab(
                onPressed: () {
                  // can not request terminal except affliate info is found
                  if (aflliateInfo == null) {
                    final error = RavenMobilePOSException(
                        code: kAffliateNotUpdated,
                        message: 'App settings missing');
                    pluginConfig.onError(error);
                    return;
                  }
                  if (!canRequestTerminal) {
                    showSnack(context,
                        'You already have a pending terminal request. You can request again, when your current request has been handled.');
                    return;
                  }

                  allTerminals.isEmpty && profileUpdate != true
                      ? pushRoute(context, const UpdateUserInfo())
                      : pushRoute(context, const RequestTerminal1());
                },
                widget: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.add, color: pluginTheme.onPrimary),
                  const Gap(2),
                  Text(
                    "Request Terminal",
                    style: subtitle.copyWith(
                        fontSize: 14, color: pluginTheme.onPrimary),
                  ),
                ]),
              ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
          child: Column(children: [
            const Gap(24),
            const RavenPayCloseButton(
              text: "",
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

            if(allTerminals.isNotEmpty) ... [


              const Gap(16),
              Text(
                  "Manage all your terminals here, request, edit and track all at the same time.",
                  style: subtitle2.copyWith(fontSize: 14)),
              const Gap(28),

            ],

            Expanded(
              child: loading == true
                  ? Center(
                      child: RavenButtonLoader(
                        size: 18,
                        color: pluginConfig.theme!.primaryColor,
                      ),
                    )
                  : allTerminals.isEmpty
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [


                              Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: AppColors.ravenGrey4,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child:Image.asset(loadAsset("mpos_image.png"), height: 70)
                              ),

                              Gap(20),

                              Text(
                                "No terminals found",
                                style: headling1.copyWith(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),

                              Gap(8),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: Text(
                                  "You do not have any terminals attached to your account, request a tereminal with the buttom below to see them here.",
                                  style: subtitle2.copyWith(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              Gap(MediaQuery.of(context).size.height/8),

                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: allTerminals.length,
                          itemBuilder: (context, index) {
                            final terminal = allTerminals[index];
                            return terminal is TerminalModel
                                ? TerminalItem(
                                    model: terminal,
                                  )
                                : terminal is TerminalRequestModel
                                    ? TerminalRequestItem(model: terminal)
                                    : SizedBox();
                          }),
            )
          ]),
        ));
  }
}
