package com.partner.app.flutter_partner_app

import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.loader.FlutterLoader
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterMain
import org.json.JSONObject

class VNPTSmartCASDK {
    private lateinit var flutterEngine: FlutterEngine
    private val CHANNEL = "vnpt.plugins.io/smartca_messaging"
    internal lateinit var methodChannel: MethodChannel
    internal var listeners = HashMap<String, (result: SmartCAResult) -> Unit>()
    internal lateinit var config: ConfigSDK
    internal var ekycService: EkycService? = null

    fun initSDK(@NonNull config: ConfigSDK) {
        try {
            this.config = config

            flutterEngine = FlutterEngine(config.context)
            // Start executing Dart code to pre-warm the FlutterEngine.
            flutterEngine.dartExecutor.executeDartEntrypoint(

                DartExecutor.DartEntrypoint(
                    FlutterMain.findAppBundlePath(),
                    "VNPTSmartCAEntryponit"
                )
            )

            FlutterEngineCache
                .getInstance()
                .put("my_engine_id", flutterEngine)

            methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

            SetResultListener(this)
        } catch (ex: Exception) {
            print(ex)
        }
    }

    internal fun getSDKIntent(): Intent {
        var intent = FlutterFragmentActivity.withCachedEngine("my_engine_id").build(config.context)
//        var intent = FlutterActivity.withCachedEngine("my_engine_id").build(config.context)

        intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        return intent
    }

    internal fun configSDK() {
        val json = JSONObject()

        json.put("clientId", config.partnerId)
        json.put("env", config.environment)
        json.put("lang", config.lang ?: SmartCALanguage.VI)

        config.lang?.let { LocaleHelper().setLocale(config.context, it) }

        methodChannel.invokeMethod(
            SmartCAMethods.configureSDK,
            json.toString(),
            object : MethodChannel.Result {
                override fun success(result: Any?) {
                    println("ConfigSDK success")
                }

                override fun error(
                    errorCode: String,
                    errorMessage: String?,
                    errorDetails: Any?
                ) {
                    Log.i("error", errorMessage.toString())

                    throw Exception(errorMessage);
                }

                override fun notImplemented() {
                    Log.i("error", "notImplemented")

                    throw Exception("Not Implemented")
                }
            })
    }

    fun getAuthentication(callBack: (result: SmartCAResult) -> Unit) {

        listeners[SmartCAMethods.getAuthenticationResult] = callBack

        methodChannel.invokeMethod(
            SmartCAMethods.getAuthentication,
            null,
            object : MethodChannel.Result {
                override fun success(result: Any?) {
                    Log.i("success", result.toString())
                }

                override fun error(
                    errorCode: String,
                    errorMessage: String?,
                    errorDetails: Any?
                ) {
                    Log.i("error", errorMessage.toString())
                    throw Exception(errorMessage);
                }

                override fun notImplemented() {
                    Log.i("error", "notImplemented")
                    throw Exception("Not Implemented");
                }
            })
    }

    fun getWaitingTransaction(@NonNull transId: String, callBack: (result: SmartCAResult) -> Unit) {
        val json = JSONObject()

        if (transId.isNullOrEmpty()) {
            var result =
                SmartCAResult(SmartCAResult.error("Invalid Parameter").map);
            callBack?.invoke(result)
            return;
        }

        json.put("tranId", transId)
        json.put("clientId", config.partnerId)

        listeners[SmartCAMethods.getWaitingTransactionResult] = callBack

        // Hiển thị giao diện SDK
        config.context.startActivity(getSDKIntent())

        methodChannel.invokeMethod(
            SmartCAMethods.getWaitingTransaction,
            json.toString(),
            object : MethodChannel.Result {
                override fun success(result: Any?) {
                    Log.i("success", result.toString())
                }

                override fun error(
                    errorCode: String,
                    errorMessage: String?,
                    errorDetails: Any?
                ) {
                    Log.i("error", errorMessage.toString())
                    throw Exception(errorMessage);
                }

                override fun notImplemented() {
                    Log.i("error", "notImplemented")
                    throw Exception("Not Implemented");
                }
            })
    }

    fun getMainInfo(callBack: (result: SmartCAResult) -> Unit) {

        listeners[SmartCAMethods.getMainInfoResult] = callBack

        methodChannel.invokeMethod(
            SmartCAMethods.getMainInfo,
            null,
            object : MethodChannel.Result {
                override fun success(result: Any?) {
                    Log.i("success", result.toString())
                }

                override fun error(
                    errorCode: String,
                    errorMessage: String?,
                    errorDetails: Any?
                ) {
                    Log.i("error", errorMessage.toString())
                    throw java.lang.Exception(errorMessage);
                }

                override fun notImplemented() {
                    Log.i("error", "notImplemented")
                    throw java.lang.Exception("Not Implemented");
                }
            })
    }

    fun destroySDK() {
        flutterEngine.destroy()
    }
}

