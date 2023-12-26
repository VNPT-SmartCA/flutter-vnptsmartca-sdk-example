import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/input_otp_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../widgets/dialog/enter_pin_for_dialog.dart';
import '../../widgets/widget.dart';

enum InputOTPType { register, changeDevice, other }

class InputOTPPage extends StatefulWidget {
  final String citizenId;
  final String phoneNumber;
  final InputOTPType inputOTPType;

  const InputOTPPage(
      {Key? key, required this.phoneNumber, required this.citizenId, this.inputOTPType = InputOTPType.other})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputOTPState();
}

class _InputOTPState extends State<InputOTPPage> {
  late InputOTPController controller;
  late StreamController<ErrorAnimationType> errorController;

  TextEditingController textEditingController = TextEditingController();
  // final _formKeyCountTimeOTP = GlobalKey<CountTimeOTPWidgetState>();

  @override
  void initState() {
    super.initState();
    controller = Get.put(InputOTPController());
    if (widget.inputOTPType == InputOTPType.changeDevice) {
      controller.sendOTP(widget.citizenId, widget.phoneNumber);
    }
    errorController = StreamController<ErrorAnimationType>();
  }

  String _getHidePhoneText() {
    String phone = widget.phoneNumber;
    if (phone.isEmpty || phone.length < 10) {
      return "";
    }
    return "${phone[0]}${phone[1]}${phone[2]}****${phone[7]}${phone[8]}${phone[09]}";
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: AppLocalizations.current.inputOTP,
        loadingWidget: const BaseLoading<InputOTPController>(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Assets.images.icDialogLock.image(width: 100),
                const SizedBox(height: 20),
                BaseText(
                  AppLocalizations.current.inputOTPVerify,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff08285C),
                  fontSize: 18,
                ),
                const SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppLocalizations.of(context).inputOTPTitle,
                    style: const TextStyle(
                      height: 1.3,
                      color: Color(0xff5768A5),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ${_getHidePhoneText()} ',
                        style: const TextStyle(
                          color: Color(0xff5768A5),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                BasePinCodeTextField(
                  errorController: errorController,
                  borderRadius: BorderRadius.circular(4),
                  shape: PinCodeFieldShape.box,
                  activeFillColor: const Color(0xFFF4F6FB),
                  obscureText: false,
                  textEditingController: textEditingController,
                  textStyle: const TextStyle(color: Color(0xff08285C), fontSize: 16, fontWeight: FontWeight.w600),
                  onChanged: (value) {
                    // setState(() {
                    //   // hasError = false;
                    //   // currentText = value;
                    // });
                  },
                  onCompleted: (value) {
                    controller.verifyOTP(widget.citizenId, widget.phoneNumber, value);
                  },
                ),
                const SizedBox(height: 10),
                CountTimeOTPWidget(
                  key: controller.formKeyCountTimeOTP,
                  onResendOTP: () {
                    controller.sendOTP(widget.citizenId, widget.phoneNumber);
                  },
                  isStartWhenInit: widget.inputOTPType == InputOTPType.register,
                ),
                const SizedBox(height: 20),
                AppButtonWidget(
                  label: AppLocalizations.current.next,
                  onTap: () {
                    controller.verifyOTP(widget.citizenId, widget.phoneNumber, textEditingController.text);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class CountTimeOTPWidget extends StatefulWidget {
  final Function? onResendOTP;
  final bool isStartWhenInit;

  const CountTimeOTPWidget({Key? key, this.onResendOTP, this.isStartWhenInit = true}) : super(key: key);

  @override
  State<CountTimeOTPWidget> createState() => CountTimeOTPWidgetState();
}

class CountTimeOTPWidgetState extends State<CountTimeOTPWidget> {
  Timer? _timer;
  int defaultTime = 60 * 4 + 30;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _start = defaultTime;
    });
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (_start == 0)
            ? RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppLocalizations.of(context).reciveOTP,
                  style: const TextStyle(
                    height: 1.3,
                    color: Color(0xff5768A5),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLocalizations.of(context).resendOTP,
                      recognizer: TapGestureRecognizer()..onTap = () => widget.onResendOTP?.call(),
                      style: const TextStyle(
                        color: Color(0xff0D75D6),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            : renderTimer()
      ],
    );
  }

  renderTimer() {
    return RichText(
      text: TextSpan(
        text: AppLocalizations.of(context).otpExpiredTime,
        style: const TextStyle(
          color: Color(0xff5768A5),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' ${formatedTime(time: _start)} ',
            style: const TextStyle(
              color: Color(0xff5768A5),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: AppLocalizations.current.second,
            style: const TextStyle(
              color: Color(0xff5768A5),
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  formatedTime({required int time}) {
    int sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    if (min <= 0) {
      return second;
    }
    return "$minute : $second";
  }
}
