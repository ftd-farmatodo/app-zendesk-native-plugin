import Flutter
import UIKit
import ZendeskSDKMessaging
import ZendeskSDK

public class ZendeskNativePlugin: NSObject, FlutterPlugin {
    var rootViewController: UIViewController!
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "zendesk_native_plugin", binaryMessenger: registrar.messenger())
        let instance = ZendeskNativePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)

    case "initialize":
      guard let args = call.arguments as? Dictionary<String, Any>,
        let accountKey = args["accountKey"] as? String,
        let apiKey = args["appId"] as? String else { return }

        Zendesk.initialize(appId: apiKey, clientId: accountKey, zendeskUrl: "https://flutter.zendesk.com")
        //Support.initialize(withZendesk: Zendesk.instance)

    case "starChat":
        guard let args = call.arguments as? Dictionary<String, Any>,
            let name = args["name"] as? String,
            let email = args["email"] as? String else { return }
    
            let chatConfiguration = ChatConfiguration()
            chatConfiguration.isPreChatFormEnabled = true
            chatConfiguration.isOfflineFormEnabled = true
            chatConfiguration.isAgentAvailabilityEnabled = true
            chatConfiguration.isChatTranscriptPromptEnabled = true
            chatConfiguration.isChatRating

        // Iniciar el chat
        let chatEngine = ChatEngine.engine()
        let viewController = Messaging.instance.buildUI(engines: [chatEngine], configs: [chatConfiguration])
        
        // Presentar el chat
        self.present(viewController, animated: true, completion: nil)


    default:
      result(FlutterMethodNotImplemented)
    }
  }

}

