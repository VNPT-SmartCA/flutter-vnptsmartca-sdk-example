package com.partner.app.flutter_partner_app

import android.os.Handler
import com.vnpt.smartca.*
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
                var customParams = CustomParams(
                    customerId = "",
                    customerPhone = "",
                    borderRadiusBtn = 999.0,
                    colorSecondBtn = "#DEF7EB",
                    colorPrimaryBtn = "#33CC80",
                    featuresLink = "",
                    packageDefault = "",
                    // password: ""
                    logoCustom = "",
                    backgroundLogin = ""
                );

                  var config = ConfigSDK(
                    env = SmartCAEnvironment.DEMO_ENV, // Môi trường kết nối DEMO/PROD
                    clientId = "", // clientId tương ứng với môi trường được cấp qua email
                    clientSecret = "", // clientSecret tương ứng với môi trường được cấp qua email
                    lang = SmartCALanguage.VI,
                    isFlutter = true,
            	    customParams = customParams,
                )

            VNPTSmartCA.initSDK(this, config)

                methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.vnpt.flutter/partner")
                methodChannel.setMethodCallHandler { call, result ->
                    when (call.method) {
                        "createAccount" -> createAccount();
                        "getAuthentication" -> getAuthentication();
                        "getMainInfo" -> getMainInfo()
                        "getWaitingTransaction" -> (call.arguments as? String)?.let { getWaitingTransaction(it) };
                        "signOut" -> signOut()
                    }
                }
            }, 2000)

        } catch (ex: Exception) {
            throw ex;
        }
    }

    private fun createAccount() {
        try {
            VNPTSmartCA.createAccount { result ->
                methodChannel.invokeMethod("createAccountResult", getMap(result))
            }
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

    private fun signOut() {
        try {
            VNPTSmartCA.signOut { result ->
                methodChannel.invokeMethod("signOutResult", getMap(result))
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
