import 'package:mobile_pos/mobile_pos_platform_interface.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';

double kHoriontalScreenPadding = 24;
MobilePOSTheme get pluginTheme =>
    MobilePosPlatform.instance.config?.theme ?? MobilePOSTheme.defaults();

RavenMobilePOSConfig get pluginConfig => MobilePosPlatform.instance.config!;

final String eKey = "1704C7E7C2AE708BA7DBFA51B062CEA9";

const String baseURLDev = 'https://postest.getravenpos.com';
const String baseURLProd = 'https://pos.getravenpos.com';
