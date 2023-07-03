import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/models/terminal_model.dart';
import 'package:mobile_pos/src/network/api_requests.dart';
import 'package:mobile_pos/src/shared_widgets/coming_soon_badge.dart';
import 'package:mobile_pos/src/shared_widgets/progress_dialog.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class ViewTerminalInfo extends StatefulWidget {
  final TerminalModel model;
  final void Function() onlabelUpdated;
  const ViewTerminalInfo(
      {super.key, required this.model, required this.onlabelUpdated});

  @override
  State<ViewTerminalInfo> createState() => _ViewTerminalInfoState();
}

class _ViewTerminalInfoState extends State<ViewTerminalInfo> {
  bool isEditing = false;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    nameController.text = widget.model.tidLabel ?? '';

    super.initState();
  }

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RavenPayScaffold(
        showLogo: pluginConfig.showLabel,
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
                // const Spacer(),
                // Icon(Icons.more_vert, color: pluginTheme.onPrimary)
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
            height: 95,
            width: double.infinity,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isEditing) ...[
                            TextField(
                              autofocus: true,
                              focusNode: _focusNode,
                              textAlign: TextAlign.start,
                              style: headling1.copyWith(
                                  color: pluginTheme.onPrimary),
                              controller: nameController,
                              cursorColor: pluginTheme.onPrimary,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            )
                          ] else ...[
                            Text(nameController.text,
                                style: headling1.copyWith(
                                    color: pluginTheme.onPrimary)),
                          ],
                          Text("View terminal information",
                              style: subtitle2.copyWith(
                                  fontSize: 13,
                                  color:
                                      pluginTheme.onPrimary.withOpacity(0.7)))
                        ]),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (isEditing) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                const ProgressDialog(
                                  status: 'Updating...',
                                ));
                        final success = await ApiRequests.updateDeviceLabel(
                            label: nameController.text,
                            serialNumber: widget.model.serial ?? '');
                        Navigator.pop(context);
                        if (success) {
                          isEditing = false;
                          setState(() {});
                          widget.onlabelUpdated.call();
                        } else {
                          showSnack(context, 'Changes failed to save.');
                          return;
                        }
                      } else {
                        isEditing = true;
                        setState(() {});
                        FocusScope.of(context).requestFocus(_focusNode);
                      }
                    },
                    child: Image.asset(
                      loadAsset(
                          isEditing ? "check_icon_3.png" : "edit_icon.png"),
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
                      // Text(
                      //   "Terminal Balance",
                      //   style: subtitle2.copyWith(fontSize: 13),
                      // ),
                      // const Gap(4),
                      // Text("NGN 650,230.00",
                      //     style: headling2.copyWith(
                      //         fontSize: 20, color: AppColors.ravenDark)),
                      // const Gap(8),
                      // const Divider(),
                      // const Gap(12),
                      TerminalRowItem(
                          title: "Serial Number",
                          detail: widget.model.serial ?? ''),
                      TerminalRowItem(
                        title: "Terminal ID",
                        detail: widget.model.tid ?? '',
                      ),

                      const Divider(),

                      Gap(32),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF7F8F7),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                color: AppColors.ravenPayGrey.withOpacity(.3)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'View Terminal Transactions',
                                    style: subtitle,
                                  ),
                                  Gap(2)
                                ],
                              ),
                            ),
                            Gap(16),
                            ComingSoonBadge(),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          )
        ]));
  }
}

class TerminalRowItem extends StatelessWidget {
  const TerminalRowItem({super.key, required this.title, required this.detail});
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: subtitle2.copyWith(fontSize: 13),
              ),
              const Gap(4),
              Text(detail,
                  style: headling2.copyWith(
                      color: AppColors.ravenDark, fontSize: 14)),
              const Gap(16),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            copyToClipBoard(context, data: detail);
          },
          child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pluginTheme.primaryColor.withOpacity(.5)),
              height: 28,
              width: 28,
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Image.asset(
                  loadAsset('copy_icon.png'),
                  color: pluginTheme.onPrimary,
                ),
              )),
        )
      ],
    );
  }
}
