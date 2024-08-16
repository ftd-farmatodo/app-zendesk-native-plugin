
import 'zendeskplugin_platform_interface.dart';

class Zendeskplugin {
  Future<String?> getPlatformVersion() {
    return ZendeskpluginPlatform.instance.getPlatformVersion();
  }
}
