package com.partner.app.flutter_partner_app

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.activity.ComponentActivity
import androidx.activity.result.ActivityResult
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import com.vnptit.idg.sdk.activity.VnptIdentityActivity
import com.vnptit.idg.sdk.utils.KeyIntentConstants.*
import com.vnptit.idg.sdk.utils.SDKEnum
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

class EkycService {
    private val channelEkyc = "com.vnpt.smartca/ekyc"
    lateinit var flutterResult: MethodChannel.Result
     var activity: Context
     var resultLauncher: ActivityResultLauncher<Intent>

    constructor(vnptSmartCA: VNPTSmartCASDK) {
        this.activity = vnptSmartCA.config.context

        var flutterEngine = FlutterEngineCache
            .getInstance().get("my_engine_id")

        if (flutterEngine != null) {
            var mapDataEkyc = HashMap<String, Any>()

            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                channelEkyc
            ).setMethodCallHandler { call, result ->
                val data = call.arguments<HashMap<String, Any>>()

                when (call.method) {
                    "eKYCFull" -> openEKYCFull(mapDataEkyc, result);
                    "configeKYC" -> {
                        mapDataEkyc.put("LANGUAGE", data?.get("languageApplication").toString())
                        mapDataEkyc.put("sdTokenKey", data?.get("sdTokenKey").toString())
                        mapDataEkyc.put("sdTokenId", data?.get("sdTokenId").toString())
                        mapDataEkyc.put("sdAuthorization", data?.get("sdAuthorization").toString())
                    }
                }
            }
            }

            resultLauncher = (this.activity as ComponentActivity).registerForActivityResult(
                ActivityResultContracts.StartActivityForResult()
            ) { result: ActivityResult ->
                this.activity.startActivity(vnptSmartCA.getSDKIntent())

                if (result.resultCode == Activity.RESULT_OK) {
                    val data = result.data
                    val resultCallBack = HashMap<String, Any>()
                    if (data != null) {
                        val frontImgPath = data.getStringExtra("FRONT_IMAGE").toString()
                        val backImgPath = data.getStringExtra("REAR_IMAGE").toString()
                        val front_image_full = data.getStringExtra("FRONT_IMAGE_FULL").toString();
                        val rear_image_full = data.getStringExtra("REAR_IMAGE_FULL").toString();

                        val nearPortrait = data.getStringExtra("PORTRAIT_NEAR_IMAGE").toString()
                        val farPortrait = data.getStringExtra("PORTRAIT_FAR_IMAGE").toString()

                        val faceVideoPath = data.getStringExtra("VIDEO_RECORDING_PATH").toString();
                        val ocr_video_path =
                            data.getStringExtra("VIDEO_RECORDING_OCR_PATH").toString();

                        resultCallBack["IdFront"] = frontImgPath
                        resultCallBack["IdFrontFull"] = front_image_full

                        resultCallBack["IdBack"] = backImgPath
                        resultCallBack["IdBackFull"] = rear_image_full

                        resultCallBack["NearPortrait"] = nearPortrait
                        resultCallBack["FarPortrait"] = farPortrait
                        resultCallBack["FaceVideo"] = faceVideoPath
                        resultCallBack["OcrIdVideo"] = ocr_video_path

                        flutterResult.success(resultCallBack)

                    } else {
                        flutterResult.notImplemented()
                    }

                } else {
                    flutterResult.notImplemented()
                }
        }
    }

    private fun openEKYCFull(data: HashMap<String, Any>, result: MethodChannel.Result) {
        flutterResult = result
        val intent = Intent(activity, VnptIdentityActivity::class.java)

        val lang = data["LANGUAGE"].toString()
        val tokenId = data["sdTokenId"].toString()
        val tokenKey = data["sdTokenKey"].toString()
        val authorization = data["sdAuthorization"].toString()
        if (intent != null) {
            intent.putExtra(ACCESS_TOKEN, authorization)
            intent.putExtra(TOKEN_ID, tokenId)
            intent.putExtra(TOKEN_KEY, tokenKey)
            intent.putExtra(DOCUMENT_TYPE, SDKEnum.DocumentTypeEnum.IDENTITY_CARD.value)
            intent.putExtra(VERSION_SDK, SDKEnum.VersionSDKEnum.ADVANCED.value)
            intent.putExtra(IS_SHOW_TUTORIAL, true)
            intent.putExtra(CAMERA_POSITION_FOR_PORTRAIT, SDKEnum.CameraTypeEnum.FRONT.value)
            intent.putExtra(IS_SHOW_SWITCH_CAMERA, false)
            intent.putExtra(IS_CHECK_MASKED_FACE, true)
            intent.putExtra(IS_CHECK_LIVENESS_CARD, false)
            intent.putExtra(CHALLENGE_CODE, "")
            intent.putExtra(IS_ENABLE_GOT_IT, true)
            intent.putExtra(LANGUAGE_SDK, lang)
            //intent.putExtra(CHECK_LIVENESS_FACE, true)
            intent.putExtra(IS_CHECK_MASKED_FACE, true)
            intent.putExtra(VERIFY_ID, "9090")
            intent.putExtra(IS_ENABLE_RECORDING_VIDEO, true)
            intent.putExtra(IS_TURN_OFF_CALL_SERVICE, true)
            intent.putExtra(IS_ENABLE_RECORDING_OCR, true)
            intent.putExtra(IS_VERIFY_FACE_FLOW, true);
            intent.putExtra(IS_ENABLE_TUTORIAL_CARD_ADVANCE,true)
            intent.putExtra(MODE_HELP_OVAL, SDKEnum.ModelHelpOvalEnum.HELP_V2.value);

            resultLauncher.launch(intent)
        }
    }
}