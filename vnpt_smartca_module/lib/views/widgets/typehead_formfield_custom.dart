// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/utils/config_input_decoration.dart';

import '../utils/color.dart';
import 'base_text.dart';

class TypeAheadFormFieldCustom<T> extends StatelessWidget {
  const TypeAheadFormFieldCustom({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.suggestionsCallback,
    this.validator,
    Null Function(dynamic value)? onSaved,
    this.onSelectedCallback,
    this.doublePadding = 16,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;

  final Function(String)? suggestionsCallback;
  final String? Function(String?)? validator;
  final String Function(dynamic option)? onSelectedCallback;
  final double doublePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: doublePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            labelText,
            isRequired: true,
            fontWeight: FontWeight.w600,
            color: const Color(0xff08285C),
          ),
          const SizedBox(
            height: 10,
          ),
          TypeAheadFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              decoration: ConfigInputDecoration().config(
                "",
                borderColor: Color(0xffA5B0C2),
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller?.text = "";
                  },
                  icon: Icon(Icons.close),
                  color: Color(0xff5768A5),
                ),
              ),
            ),
            suggestionsCallback: (pattern) {
              return suggestionsCallback?.call(pattern);
            },
            itemBuilder: (context, suggestion) {
              dynamic option = suggestion;
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                child: Text(
                  option.name ?? option.toString(),
                  style: TextStyle(fontSize: 14.0, color: HexColor("#08285C")),
                ),
              );
            },
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (suggestion) {
              onSelectedCallback?.call(suggestion);
            },
            noItemsFoundBuilder: (context) => Container(
              height: 50,
              child: Center(
                child: Text(
                  AppLocalizations.current.dataNotFound,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: HexColor("#6079A0"), fontWeight: FontWeight.normal, fontSize: 16.0),
                ),
              ),
            ),
            // ignore: missing_return
            validator: this.validator,
            onSaved: (value) => {},
          )
        ],
      ),
    );
  }
}
