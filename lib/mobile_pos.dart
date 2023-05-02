
import 'mobile_pos_platform_interface.dart';

class MobilePos {
  Future<String?> getPlatformVersion() {
    return MobilePosPlatform.instance.getPlatformVersion();
  }
}
