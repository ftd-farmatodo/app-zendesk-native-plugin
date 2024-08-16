import 'package:flutter_test/flutter_test.dart';
import 'package:zendeskplugin/zendeskplugin.dart';
import 'package:zendeskplugin/zendeskplugin_platform_interface.dart';
import 'package:zendeskplugin/zendeskplugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZendeskpluginPlatform
    with MockPlatformInterfaceMixin
    implements ZendeskpluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZendeskpluginPlatform initialPlatform = ZendeskpluginPlatform.instance;

  test('$MethodChannelZendeskplugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZendeskplugin>());
  });

  test('getPlatformVersion', () async {
    Zendeskplugin zendeskpluginPlugin = Zendeskplugin();
    MockZendeskpluginPlatform fakePlatform = MockZendeskpluginPlatform();
    ZendeskpluginPlatform.instance = fakePlatform;

    expect(await zendeskpluginPlugin.getPlatformVersion(), '42');
  });
}
