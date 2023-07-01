import 'package:mobile_pos/mobile_pos_platform_interface.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/models/app_info_model.dart';
import 'package:mobile_pos/src/models/keydetails.dart';

double kHoriontalScreenPadding = 24;
MobilePOSTheme get pluginTheme =>
    MobilePosPlatform.instance.config?.theme ?? MobilePOSTheme.defaults();

RavenMobilePOSConfig get pluginConfig => MobilePosPlatform.instance.config!;

bool? profileUpdate;
AflliateInfoModel? aflliateInfo;
KeyDetails? keyDetails;

final String eKey = "1704C7E7C2AE708BA7DBFA51B062CEA9";

const String baseURLDev = 'https://postest.getravenpos.com';
const String baseURLProd = 'https://posapi.getravenbank.com/v1';
