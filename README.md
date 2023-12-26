# Tích hợp Flutter

-    Yêu cầu Flutter >= 3.1.5

## Bước 1: Tải module và cấu hình

-    Copy thư mục vnpt_smartca_module trong example này vào trong project

-    Bổ sung cài đặt module vào project theo đường dẫn tới thư mục vnpt_smartca_module

```
vnpt_smartca_module:
    path: ../vnpt_smartca_module
```

-    Bổ sung đoạn code sau vào file main.dart

```
@pragma('vm:entry-point')
void VNPTSmartCAEntryponit() => bootstrapSmartCAApp();
```

-    Bổ sung đoạn code thiết lập tương tác giữa Flutter và native

```
  static const platform = MethodChannel("com.vnpt.flutter/partner");

  Future<void> getAuthentication() async {
    await platform.invokeMethod('getAuthentication');
  }

  Future<void> getWaitingTransaction() async {
    await platform.invokeMethod('getWaitingTransaction');
  }

  Future<void> toMainPage() async {
    await platform.invokeMethod('getMainInfo');
  }

  initMethod(BuildContext context) {
    platform.setMethodCallHandler((call) async {
      if (call.method == "getAuthenticationResult") {
        if (call.arguments is Map && call.arguments["status"] == 0) {
          // Xử lý khi thành công
        } else {
          // Xử lý khi thất bại
        }
      } else if (call.method == "getMainInfoResult") {
        debugPrint("getMainInfoResult");
      } else if (call.method == "getWaitingTransactionResult") {
        if (call.arguments is Map && call.arguments["status"] == 0) {
          // Xử lý khi thành công
        } else {
          // Xử lý khi thất bại
        }
      }
    });
  }
```

# Tích hợp iOS

-    Yêu cầu iOS >= 13.0

## Bước 1: Tải SDK và cấu hình Project
-    Copy thư mục SdkSmartCA theo đường dẫn **ios/Runner** trong example này

-    Kéo thả toàn bộ file *.xcframework và *.framework vào trong project. Đi tới Targets Project -> General -> Frameworks, Libraries, and Embedded Content

-    Tất cả các thư viện cấu hình Embed & Sign

-    Nếu project chưa cấu hình quyền sử dụng camera(NSCameraUsageDescription) hãy bổ sung cấu hình quyền sử dụng camera trong Info.plist

## Bước 2: Khởi tạo SDK
- Code tại **AppDelegate**
```swift
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
```

# Tích hợp Android

- Yêu cầu Android SDK >= 6.0 (API level 23).


## Bước 1: Tải SDK và cấu hình Project

- Tải về bộ tích hợp SDK tại https://github.com/VNPT-SmartCA/vnpt_smartca_sdk_android và giải nén ra thư mục.
- Sau khi giải nén, copy các file aar, thư mục repo vào thư mục **libs** trong **app** (1)
-  Thêm thông tin cấu hình vào file **app/settings.gradle** như dưới:

````
pluginManagement {  
  repositories {  
  gradlePluginPortal()  
        google()  
        mavenCentral()  
    }  
}  
  
String storageUrl = System.env.FLUTTER_STORAGE_BASE_URL ?: "https://storage.googleapis.com"  
  
dependencyResolutionManagement {  
  repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)  
    repositories {  
  google()  
        mavenCentral()  
        maven {  
        //Đường dẫn thư mục chứa **repo** ở bước 1
  url 'app/libs/repo'  
  }  
  // bỏ qua nếu project phát triển bằng Flutter
  maven {  
  url "$storageUrl/download.flutter.io"  
  }  
  maven { url "https://jitpack.io" }  
  
  jcenter()  
    }  
}  
````

- Thêm các thông tin cấu hình vào app/build.gradle

````
 plugins {  
  id 'com.android.application'  
  id 'org.jetbrains.kotlin.android'  
  id 'org.jetbrains.kotlin.plugin.serialization' version '1.6.21'  
}
````

- Trong android

````
packagingOptions {  
  pickFirst 'lib/x86/libc++_shared.so'  
  pickFirst 'lib/x86_64/libc++_shared.so'  
  pickFirst 'lib/armeabi-v7a/libc++_shared.so'  
  pickFirst 'lib/arm64-v8a/libc++_shared.so'  
}  
  
compileOptions {  
  sourceCompatibility JavaVersion.VERSION_1_8  
  targetCompatibility JavaVersion.VERSION_1_8  
}  
kotlinOptions {  
  jvmTarget = '1.8'  
}  
aaptOptions {  
  noCompress "bic"  
}  
sourceSets {  
  main.java.srcDirs += 'src/main/kotlin'  
}
````

- Trong android/defaultConfig thêm

````
 ndk {  
  // abiFilters 'armeabi-v7a', 'arm64-v8a','x86_64'  
  debugSymbolLevel 'FULL'  
}
````

- Trong android/buildType thêm 

````
profile {  
  initWith debug  
}
````

- Trong dependencies bổ sung các implementation liên quan tới sdk

````
dependencies {
//..
implementation 'com.vnpt.smartca.module.vnpt_smartca_module:flutter_release:1.0'  
//Đường dẫn tới các file aar (xem bước 1)
implementation files('libs/vnpt_smartca_sdk_lib-release.aar')  
implementation files('libs/ekyc_sdk-release-v3.2.7.aar')  
implementation files('libs/eContract-v3.1.0.aar'
..//
 }
````

- Thêm FlutterActivity trong file **AndroidManifest.xml** như sau:

```` java
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-feature android:name="android.hardware.camera" />
    //......
    <application
        //......
        
        // bỏ qua nếu project phát triển bằng Flutter
        <activity android:name="io.flutter.embedding.android.FlutterActivity"
            android:theme="@style/Theme.Smartca_android_example"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize"/>

    </application>
````

- Bổ sung thuộc tính dưới đây vào file **gradle.properties**

```` java
    android.enableJetifier=true
````

- Bổ sung thuộc tính dưới đây vào file **proguard-rules.pro**

```` java
    -keep class ai.icenter.face3d.native_lib.Face3DConfig { *; }
````


## Bước 2: Khởi tạo SDK

- Thêm đoạn code dưới đây tại **MainActivity**:

```` java
import android.os.Handler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterFragmentActivity() {
    var VNPTSmartCA = VNPTSmartCASDK()
    lateinit var methodChannel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        try {
            Handler().postDelayed({
                val config = ConfigSDK()
                config.context = this
                config.partnerId = "VNPTSmartCAPartner-add1fb94-9629-49`47-b7d8-f2671b04c747"
                config.environment = SmartCAEnvironment.DEMO_ENV
                config.lang = SmartCALanguage.VI

                VNPTSmartCA.initSDK(config)

                methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.vnpt.flutter/partner")
                methodChannel.setMethodCallHandler { call, result ->
                    when (call.method) {
                        "getAuthentication" -> getAuthentication();
                        "getMainInfo" -> getMainInfo()
                        "getWaitingTransaction" -> (call.arguments as? String)?.let { getWaitingTransaction(it) };
                    }
                }
            }, 2000)

        } catch (ex: Exception) {
            throw ex;
        }
    }

    private fun getAuthentication() {
        try {
            VNPTSmartCA.getAuthentication { result ->
                methodChannel.invokeMethod("getAuthenticationResult", getMap(result))
            }
        } catch (ex: Exception) {
            throw ex;
        }
    }

    private fun getMainInfo() {
        try {
            VNPTSmartCA.getMainInfo { result ->
                methodChannel.invokeMethod("getMainInfoResult", getMap(result))
            }
        } catch (ex: Exception) {
            throw ex;
        }
    }

    private fun getWaitingTransaction(transId: String) {
        try {
            VNPTSmartCA.getWaitingTransaction(transId) { result ->
                methodChannel.invokeMethod("getWaitingTransactionResult", getMap(result))
            }
        } catch (ex: Exception) {
            throw ex;
        }
    }

    fun getMap(result: SmartCAResult) : HashMap<String, Any> {
        var hashMap = HashMap<String, Any> ()
        hashMap.put("status", result.status)
        result.statusDesc?.let { hashMap.put("statusDesc", it) }
        result.data?.let { hashMap.put("data", it) }
        return hashMap;
    }
}
````

