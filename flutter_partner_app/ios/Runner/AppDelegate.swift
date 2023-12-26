import UIKit
import Flutter
import SmartCASDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var channelFlutter: FlutterMethodChannel?
    var vnptSmartCASDK: VNPTSmartCASDK?
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let rootView = window?.rootViewController as? FlutterViewController {
            self.vnptSmartCASDK = VNPTSmartCASDK(
                viewController: rootView,
                partnerId: "CLIENT_ID",
                environment: VNPTSmartCASDK.ENVIRONMENT.DEMO,
                lang: VNPTSmartCASDK.LANG.VI,
                isFlutterApp: true)
            
            let channel = FlutterMethodChannel(name: "com.vnpt.flutter/partner", binaryMessenger: rootView.binaryMessenger)
            channel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                self.channelFlutter = channel
                
                if call.method == "getAuthentication" {
                    self.getAuthentication()
                } else if call.method == "getMainInfo" {
                    self.getMainInfo()
                } else if call.method == "getWaitingTransaction" {
                    let transactionId = call.arguments as? String ?? ""
                    self.getWaitingTransaction(transactionId: transactionId)
                }
            })
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // Lấy thông tin về AccessToken & CredentialId
    func getAuthentication() {
        self.vnptSmartCASDK?.getAuthentication(callback: { result in
            self.channelFlutter?.invokeMethod("getAuthenticationResult", arguments: result.toJson())
        });
    }
    
    func getMainInfo() {
        self.vnptSmartCASDK?.getMainInfo(callback: { result in
            self.channelFlutter?.invokeMethod("getMainInfoResult", arguments: result.toJson())
        })
    }
    
    // Khách hàng xác nhận / hủy giao dịch.
    func getWaitingTransaction(transactionId: String) {
        self.vnptSmartCASDK?.getWaitingTransaction(tranId: transactionId, callback: { result in
            self.channelFlutter?.invokeMethod("getWaitingTransactionResult", arguments: result.toJson())
        })
    }
}
