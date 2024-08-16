import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zendeskplugin_method_channel.dart';

abstract class ZendeskpluginPlatform extends PlatformInterface {
  /// Constructs a ZendeskpluginPlatform.
  ZendeskpluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZendeskpluginPlatform _instance = MethodChannelZendeskplugin();

  /// The default instance of [ZendeskpluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelZendeskplugin].
  static ZendeskpluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZendeskpluginPlatform] when
  /// they register themselves.
  static set instance(ZendeskpluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
