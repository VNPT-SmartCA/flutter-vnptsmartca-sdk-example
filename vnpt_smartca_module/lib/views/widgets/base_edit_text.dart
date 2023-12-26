import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../gen/assets.gen.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/utils/config_input_decoration.dart';
import '../../../views/utils/datetime_format.dart';
import 'package:intl/intl.dart';

import 'base_text.dart';

class BaseEditText extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String formName;
  final bool readOnly;
  final int maxLength;
  final String placeHolder;
  final Color? backgroundColor;
  final String? initValue;
  final List<String> data;
  final bool? isPickDate;
  final List<FormFieldValidator<String>> validators;
  final TextInputAction textInputAction;
  final double paddingHorizontal;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? borderColor;

  const BaseEditText({
    super.key,
    required this.label,
    required this.isRequired,
    required this.formName,
    this.readOnly = false,
    required this.maxLength,
    required this.placeHolder,
    this.initValue,
    this.data = const [],
    this.isPickDate,
    this.validators = const [],
    this.textInputAction = TextInputAction.next,
    this.backgroundColor,
    this.paddingHorizontal = 16,
    this.controller,
    this.keyboardType,
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            label,
            isRequired: isRequired,
            fontWeight: FontWeight.w600,
            color: const Color(0xff08285C),
          ),
          const SizedBox(
            height: 10,
          ),
          isPickDate == true
              ? FormBuilderDateTimePicker(
                  name: formName,
                  inputType: InputType.date,
                  initialValue: initValue == null ? null : DatetimeFormat().parseStringToDate(initValue!),
                  decoration: ConfigInputDecoration().config(placeHolder,
                      suffixIcon: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Assets.images.icCalendar.image(width: 20, height: 20, fit: BoxFit.fill),
                      )),
                  format: DateFormat("dd/MM/yyyy"),
                  textInputAction: textInputAction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: AppLocalizations.current.inputRequired(label)),
                    // ...validators,
                  ]),
                )
              : (data.isNotEmpty
                  ? FormBuilderDropdown(
                      name: formName,
                      enabled: !readOnly,
                      initialValue: initValue,
                      decoration: ConfigInputDecoration().config(placeHolder),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: AppLocalizations.current.inputRequired(label)),
                        ...validators
                      ]),
                      onChanged: (value) {
                        FocusManager.instance.primaryFocus?.nextFocus();
                      },
                      items: data
                          .map((gender) => DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList())
                  : FormBuilderTextField(
                      name: formName,
                      autofocus: false,
                      readOnly: readOnly,
                      initialValue: initValue,
                      // onSubmitted: (value) => controller.onFormSubmit(),
                      controller: controller,
                      textInputAction: textInputAction,
                      keyboardType: keyboardType,
                      maxLength: maxLength,
                      decoration: ConfigInputDecoration().config(placeHolder, borderColor: borderColor, fillColor: backgroundColor),
                      validator: isRequired
                          ? FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: AppLocalizations.current.inputRequired(label)),
                              FormBuilderValidators.maxLength(maxLength,
                                  errorText: AppLocalizations.current.maxLength(maxLength)),
                              ...validators
                            ])
                          : FormBuilderValidators.compose([
                              FormBuilderValidators.maxLength(maxLength,
                                  errorText: AppLocalizations.current.maxLength(maxLength)),
                              ...validators
                            ]),
                    ))
        ],
      ),
    );
  }
}
