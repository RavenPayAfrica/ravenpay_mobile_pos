import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_pos/mobile_pos_platform_interface.dart';
import 'package:mobile_pos/src/helpers/enums.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/network/api_requests.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';
import 'package:mobile_pos/src/views/generate_paycode/business_phone_number.dart';
import 'package:mobile_pos/src/views/home/widget/payment_method_bottomsheet.dart';
import 'package:mobile_pos/src/views/home/widget/home_item.dart';
import 'package:mobile_pos/src/views/request_pos/request_terminal_index.dart';
import 'package:mobile_pos/src/views/secure_pin_share/add_card_pin.dart';
import 'package:mobile_pos/src/shared_widgets/powerby_by_raven_widget.dart';
import 'package:mobile_pos/src/shared_widgets/purchase_amount.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_bottomsheet.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_close_button.dart';
import 'package:mobile_pos/src/shared_widgets/ravenpay_scaffold.dart';

class RavenPayApp extends StatefulWidget {
  const RavenPayApp({super.key});

  @override
  State<RavenPayApp> createState() => _RavenPayAppState();
}

class _RavenPayAppState extends State<RavenPayApp> {
  @override
  void initState() {
    super.initState();
    initialize();
    setupPermissions();
  }

  void initialize() async {
    await ApiRequests.fetchAppInfo();
    await ApiRequests.registerUser();
  }

  setupPermissions() async {
    await MobilePosPlatform.instance
        .checkConnectivityStatus(ConnectivityType.bluetooth);
  }

  @override
  Widget build(BuildContext context) {
    return RavenPayScaffold(
      backgroundColor: pluginTheme.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalScreenPadding),
        child: Column(
          children: [
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [RavenPayCloseButton()],
            ),
            const Spacer(),
            Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                    height: 48,
                    width: 48,
                    child: pluginConfig.appInfo.appLogo ??
                        ClipOval(
                          child: Container(
                            decoration: BoxDecoration(
                                color: pluginConfig.theme!.secondaryColor),
                            child: Center(
                              child: Text(
                                pluginConfig.appInfo.appName[0],
                                style: headling1.copyWith(
                                    color: pluginConfig.theme!.onPrimary),
                              ),
                            ),
                          ),
                        ))),
            const Gap(24),
            Text(
                "Hi ${pluginConfig.customerInfo.firstName}, Accept payment much easier with ${pluginConfig.appInfo.appName}",
                style: headling1.copyWith(color: pluginTheme.onPrimary)),
            const Gap(32),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: Column(children: [
                HomeItem(
                    onTap: () {
                      showRavenPayBottomSheet(context,
                          child: const PaymentMethod());
                    },
                    asset: "receive_payment.png",
                    title: "Receive Payment",
                    subTitile: "Accept payment from your customers"),
                HomeItem(
                    onTap: () {
                      pushRoute(context, const AddCardPin());
                    },
                    asset: "secure_pin.png",
                    title: "Secure PIN Share",
                    subTitile: "Securely share card PIN for payment"),
                HomeItem(
                    onTap: () {
                      pushRoute(context, const RequestTerminalIndex());
                    },
                    comingSoon: false,
                    asset: "terminal_icon.png",
                    title: "Terminals",
                    subTitile: "Manage your point of sales terminals"),
                HomeItem(
                    comingSoon: true,
                    onTap: () {
                      pushRoute(
                          context,
                          PurchaseAmount(
                              onProceed: (mContext, amount) => pushRoute(
                                  mContext, const BusinessPhoneNumber()),
                              title: "Enter Amount"));
                    },
                    asset: "generate_pay_code.png",
                    title: "Generate Paycode",
                    subTitile: "Receive payment from a third-party terminal"),
              ]),
            ),
            const Gap(32),
            const PoweredByRaven(
              transparent: true,
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
