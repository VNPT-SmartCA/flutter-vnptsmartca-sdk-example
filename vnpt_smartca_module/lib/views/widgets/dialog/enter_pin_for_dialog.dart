import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/utils/constants.dart';
import '../../../gen/assets.gen.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../theme/styles.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/base_text.dart';

class EnterPINDialog extends StatefulWidget {
  final String description;
  final String buttonText;
  final Color buttonColor;
  final ValueChanged<String> callback;

  const EnterPINDialog({
    Key? key,
    required this.description,
    required this.buttonText,
    required this.callback,
    required this.buttonColor,
  }) : super(key: key);

  @override
  _EnterPINDialogState createState() => _EnterPINDialogState();
}

class _EnterPINDialogState extends State<EnterPINDialog> {
  var onTapRecognizer;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _secureLocalDataSource = getIt<SecureLocalStorageService>();

  late String? _userPIN;
  late StreamController<ErrorAnimationType> errorController;

  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  String errorMesg = '';
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _getUserPIN();
    onTapRecognizer = TapGestureRecognizer().onTap = () {
      Navigator.pop(context);
    };
    errorController = StreamController<ErrorAnimationType>();
    textEditingController.clear();
  }

  void _getUserPIN() async {
    try {
      _userPIN = await _secureLocalDataSource.getLastData(USER_PIN_KEY);
    } catch (e) {}
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void _onValidatePIN() {
    formKey.currentState!.validate();
    var reg = "012345678901234567890";
    var req1 = "987654321098765432109";

    if (currentText.length != 6) {
      // Triggering error shake animation
      errorController.add(ErrorAnimationType.shake);
      setState(() {
        hasError = true;
        errorMesg = AppLocalizations.current.pinValidateSixDigit;
      });
    } else if (reg.contains(currentText) || req1.contains(currentText)) {
      // Triggering error shake animation
      errorController.add(ErrorAnimationType.shake);
      setState(() {
        textEditingController.clear();
        hasError = true;
        errorMesg = AppLocalizations.current.pinValidateSequence;
      });
    } else if (int.parse(currentText) % 111111 == 0) {
      // errorController.add(ErrorAnimationType.shake);
      setState(() {
        textEditingController.clear();
        hasError = true;
        errorMesg = AppLocalizations.current.pinValidateTheSame;
      });
    } else if (_userPIN != null && currentText != _userPIN) {
      // errorController.add(ErrorAnimationType.shake);
      setState(() {
        textEditingController.clear();
        hasError = true;
        errorMesg = AppLocalizations.current.invalidPIN;
      });
    } else {
      Get.back(closeOverlays: true);
      widget.callback(currentText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Assets.images.icDialogLock.image(
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BaseText(
                widget.description,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff08285C),
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
                child: BasePinCodeTextField(
                  errorController: errorController,
                  textEditingController: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      hasError = false;
                      currentText = value;
                    });
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: BaseText(
                hasError ? errorMesg : "",
                color: Color(0xffA55757),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: const EdgeInsets.all(AppGap.g16),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButtonWidget(
                        key: UniqueKey(),
                        labelColor: Color(0xff0D75D6),
                        label: AppLocalizations.current.cancel,
                        backgroundColor: Color(0xffE0F0FF),
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppButtonWidget(
                        key: UniqueKey(),
                        label: widget.buttonText,
                        onTap: _onValidatePIN,
                      ),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}

class BasePinCodeTextField extends StatelessWidget {
  final StreamController<ErrorAnimationType> errorController;
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final bool? obscureText;
  final PinCodeFieldShape? shape;
  final Color? activeFillColor;
  final BorderRadius? borderRadius;

  const BasePinCodeTextField({
    Key? key,
    required this.errorController,
    required this.textEditingController,
    required this.onChanged,
    this.focusNode,
    this.onCompleted,
    this.textStyle,
    this.obscureText,
    this.shape,
    this.activeFillColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: obscureText ?? true,
      animationType: AnimationType.fade,
      pastedTextStyle: const TextStyle(
        color: Color(0xffC9CED7),
        fontWeight: FontWeight.bold,
      ),
      // ignore: prefer-extracting-callbacks
      onChanged: onChanged,
      pinTheme: PinTheme(
        shape: shape ?? PinCodeFieldShape.underline,
        borderWidth: 1,
        borderRadius: borderRadius,
        fieldHeight: Get.size.width / 10,
        fieldWidth: Get.size.width / 10,
        activeFillColor: activeFillColor ?? Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveColor: const Color(0xffC9CED7),
        activeColor: const Color(0xffC9CED7),
        selectedColor: const Color(0xffC9CED7),
      ),
      autoFocus: true,
      focusNode: focusNode,
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 100),
      textStyle: textStyle ?? const TextStyle(fontSize: 10, height: 1.6),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      // boxShadows: const [
      //   BoxShadow(
      //     offset: Offset(0, 1),
      //     color: Colors.black12,
      //     blurRadius: 10,
      //   )
      // ],
    );
  }
}
