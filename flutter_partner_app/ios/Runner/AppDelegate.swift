import UIKit
import Flutter
import SmartCASDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var channelFlutter: FlutterMethodChannel?
    var vnptSmartCASDK: VNPTSmartCASDK?
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let rootView = window?.rootViewController as? FlutterViewController {
            let customParams = CustomParams(
                customerId: "",
                borderRadiusBtn: 999,
                colorSecondBtn: "#FFFFFF",
                colorPrimaryBtn: "#4788FF",
                featuresLink: "https://www.google.com/?hl=vi",
                customerPhone: "",
                packageDefault: "",
                password: "",
                logoCustom: "",
                backgroundLogin: ""
            )
        
            let config = SDKConfig(
                clientId: "",
                clientSecret: "", 
                environment: ENVIRONMENT.PRODUCTION, 
                lang: LANG.VI, 
                isFlutterApp: true, 
                customParams: customParams
                );

            self.vnptSmartCASDK = VNPTSmartCASDK(
                viewController: rootView,
                config: config)
            
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
                } else if call.method == "signOut"{
                    self.signOut()
                } else if call.method == "createAccount" {
                    self.createAccount()
                }
            })
        }
        
        GeneratedPluginRegistrant.register(with: self)
        GeneratedPluginRegistrant.register(with: self.vnptSmartCASDK?.flutterEngine as! FlutterPluginRegistry);
        
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
    
    func signOut() {
        self.vnptSmartCASDK?.signOut(callback: { result in
            self.channelFlutter?.invokeMethod("signOutResult", arguments: result.toJson())
        })
    }
    
    func createAccount() {
        self.vnptSmartCASDK?.createAccount(callback: { result in
            self.channelFlutter?.invokeMethod("createAccountResult", arguments: result.toJson())
        })
    }
}
