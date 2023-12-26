package com.partner.app.flutter_partner_app

import android.util.Log

class SetResultListener {
    constructor(vnptSmartCA: VNPTSmartCASDK) {
        vnptSmartCA.methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                //
                SmartCAMethods.getWaitingTransactionResult -> {
                    try {
                        var result = SmartCAResult((call.arguments as Map<String, Any?>))
                        var callBack =
                            vnptSmartCA.listeners[SmartCAMethods.getWaitingTransactionResult];
                        callBack?.invoke(result)
                    } catch (ex: Exception) {
                        Log.e("ERROR", ex.toString());
                    }
                }

                SmartCAMethods.getAuthenticationResult -> {
                    try {
                        var result = SmartCAResult((call.arguments as Map<String, Any?>))
                        var status = result.status;
                        // Không lấy được token, credential thì show giao diện
                        if (status != SmartCAResultCode.SUCCESS_CODE
                            && status != SmartCAResultCode.USER_CANCEL_CODE
                        ) {
                            vnptSmartCA.config.context.startActivity(vnptSmartCA.getSDKIntent())
                        }

                        var callBack =
                            vnptSmartCA.listeners[SmartCAMethods.getAuthenticationResult];
                        callBack?.invoke(result)

                    } catch (ex: Exception) {
                        Log.e("ERROR", ex.toString());
                    }
                }

                SmartCAMethods.getMainInfoResult -> {
                    try {
                        var result = SmartCAResult((call.arguments as Map<String, Any?>))
                        var status = result.status;
                        if (status == SmartCAResultCode.SUCCESS_CODE) {
                            // Display interface information certificate
                            vnptSmartCA.config.context.startActivity(vnptSmartCA.getSDKIntent())
                        }
                        var callBack =
                            vnptSmartCA.listeners[SmartCAMethods.getMainInfoResult];
                        callBack?.invoke(result)

                    } catch (ex: Exception) {
                        Log.e("ERROR", ex.toString());
                    }
                }

                SmartCAMethods.activeEKYC -> {
                    try {
                        if (vnptSmartCA.ekycService == null)
                            vnptSmartCA.ekycService = EkycService(vnptSmartCA);

                    } catch (ex: Exception) {
                        Log.e("ERROR", ex.toString());
                    }
                }

                SmartCAMethods.userCancel -> {

                }

                SmartCAMethods.isReady -> {
                    vnptSmartCA.configSDK()
                }

                else -> result.notImplemented()
            }
        }
    }
}