package com.partner.app.flutter_partner_app

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import kotlin.properties.Delegates

class SmartCAResult(val map: Map<String, Any?>) {
    val status: Int by map
    val statusDesc: String? by map
    val data by map

    companion object {
        fun error(errorMessage: String?): SmartCAResult {
            return SmartCAResult(
                mapOf(
                    "status" to SmartCAResultCode.UNKNOWN_ERROR_CODE,
                    "statusDesc" to errorMessage
                )
            )
        }
    }
}

object SmartCAResultCodeDesc {
    val UNKNOWN_ERROR = "UNKNOWN_ERROR";
    val USER_CANCEL = "USER_CANCEL";
    val REJECTED_SUCCESS = "REJECTED_SUCCESS";
    val CONFIRMED_SUCCESS = "CONFIRMED_SUCCESS";
    val ENROLL_SUCCESS = "ENROLL_SUCCESS";
    val SUCCESS = "SUCCESS";
    val BIOMETRIC_SUCCESS = "BIOMETRIC_SUCCESS";
}

object SmartCAResultCode {
    val UNKNOWN_ERROR_CODE = 2;
    val USER_CANCEL_CODE = 1;
    val SUCCESS_CODE = 0;
}

object SmartCAMethods {
    var getAuthentication = "getAuthentication"
    var getAuthenticationResult = "getAuthenticationResult"

    var getWaitingTransaction = "getWaitingTransaction"
    var getWaitingTransactionResult = "getWaitingTransactionResult"

    var getMainInfo = "getMainInfo";
    var getMainInfoResult = "getMainInfoResult";

    var userCancel = "userCancel"

    var configureSDK = "VNPTSmartCASDK#start"
    var isReady = "VNPTSmartCASDK#isReady"

    var activeEKYC = "activeEKYC"
}

object SmartCAEnvironment {
    var DEMO_ENV = 1;
    var PROD_ENV = 2;
}

class ConfigSDK() {
    lateinit var context: Context
    lateinit var partnerId: String

    var lang: String? = null
    var environment by Delegates.notNull<Int>()
}

object SmartCALanguage {
    var EN = "en";
    var VI = "vi";
}
