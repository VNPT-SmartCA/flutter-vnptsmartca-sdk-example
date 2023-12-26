package com.partner.app.flutter_partner_app

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
