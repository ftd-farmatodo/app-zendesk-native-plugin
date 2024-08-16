import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zendeskplugin_platform_interface.dart';

/// An implementation of [ZendeskpluginPlatform] that uses method channels.
class MethodChannelZendeskplugin extends ZendeskpluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zendeskplugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
