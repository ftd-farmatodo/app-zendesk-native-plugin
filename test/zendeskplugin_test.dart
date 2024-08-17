import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:zendeskplugin/zendeskplugin.dart';
import 'package:zendeskplugin/zendeskplugin_method_channel.dart';
import 'package:zendeskplugin/zendeskplugin_platform_interface.dart';

class MockZendeskpluginPlatform
    with MockPlatformInterfaceMixin
    implements ZendeskpluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> addTags({List<String>? tags}) {
    throw UnimplementedError();
  }

  @override
  Future<void> initialize(String accountKey, String appId) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeTags({List<String>? tags}) {
    throw UnimplementedError();
  }

  @override
  Future<void> setVisitorInfo(
      {String? name, String? email, String? phoneNumber, String? department}) {
    throw UnimplementedError();
  }

  @override
  Future<void> startChat(
      {Color? primaryColor,
      bool isPreChatFormEnabled = true,
      bool isAgentAvailabilityEnabled = true,
      bool isChatTranscriptPromptEnabled = true,
      bool isOfflineFormEnabled = true}) {
    throw UnimplementedError();
  }
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
