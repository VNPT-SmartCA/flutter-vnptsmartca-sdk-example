// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../widgets/dialog/enter_pin_for_dialog.dart';
import '../../../../widgets/widget.dart';

import '../../../../i18n/generated_locales/l10n.dart';

final formKeyPinGlobal = GlobalKey<FormState>();

class CreatePinCodeTextField extends StatefulWidget {
  final ValueChanged<String> callback;
  final FocusNode focusNode;
  final ValueChanged<String> onCompleteCallback;
  final String? title;
  final PinCodeFieldShape? shape;
  final bool showTitle;

  const CreatePinCodeTextField({
    Key? key,
    required this.callback,
    required this.focusNode,
    required this.onCompleteCallback,
    this.title,
    this.shape,
    this.showTitle = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreatePinCodeTextFieldState();
}

class _CreatePinCodeTextFieldState extends State<CreatePinCodeTextField> {
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

  void validatePin(String pin) {
    widget.callback(pin);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? BaseText(
                widget.title ?? AppLocalizations.current.enterPinCode,
                fontWeight: FontWeight.w600,
                color: Color(0xff08285C),
              )
            : Container(),
        SizedBox(height: widget.showTitle ? 5 : 0),
        BasePinCodeTextField(
          focusNode: widget.focusNode,
          errorController: errorController,
          textEditingController: textEditingController,
          onCompleted: widget.onCompleteCallback,
          onChanged: validatePin,
          shape: widget.shape,
        ),
      ],
    );
  }
}
