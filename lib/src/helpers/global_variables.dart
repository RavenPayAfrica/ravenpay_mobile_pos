import 'package:mobile_pos/mobile_pos_platform_interface.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';

double kHoriontalScreenPadding = 24;
MobilePOSTheme get pluginTheme =>
    MobilePosPlatform.instance.config?.theme ?? MobilePOSTheme.defaults();

RavenMobilePOSConfig get pluginConfig => MobilePosPlatform.instance.config!;
