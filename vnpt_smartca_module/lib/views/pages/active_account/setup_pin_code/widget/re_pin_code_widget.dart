// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../widgets/dialog/enter_pin_for_dialog.dart';
import '../../../../widgets/widget.dart';

import '../../../../i18n/generated_locales/l10n.dart';

final formKeyPinGlobal = GlobalKey<FormState>();

class ConfirmPinCodeTextField extends StatefulWidget {
  final String pin;
  final ValueChanged<String> callback;
  final FocusNode focusNode;

  const ConfirmPinCodeTextField({
    Key? key,
    required this.pin,
    required this.callback,
    required this.focusNode,
  }) : super(key: key);

  State<StatefulWidget> createState() => _ConfirmPinCodeTextFieldState();
}

class _ConfirmPinCodeTextFieldState extends State<ConfirmPinCodeTextField> {
  bool hasError = false;
  late StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String errorMsg = '';

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
    formKey = formKeyPinGlobal;
    textEditingController.clear();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void validatePin(String rePin) {
    widget.callback(rePin);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          AppLocalizations.current.confirmPINTitle,
          fontWeight: FontWeight.w600,
          color: Color(0xff08285C),
        ),
        SizedBox(height: 5),
        BasePinCodeTextField(
          focusNode: widget.focusNode,
          errorController: errorController,
          textEditingController: textEditingController,
          onChanged: validatePin,
        ),
      ],
    );
  }
}
