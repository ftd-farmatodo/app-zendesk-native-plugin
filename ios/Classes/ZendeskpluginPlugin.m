#import "ZendeskpluginPlugin.h"
#if __has_include(<zendesk_native_plugin/zendesk_native_plugin-Swift.h>)
#import <zendesk_native_plugin/zendesk_native_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "zendesk_native_plugin-Swift.h"
#endif

@implementation ZendeskpluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [ZendeskNativePlugin registerWithRegistrar:registrar];
}
@end