import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../gen/fonts.gen.dart';
import '../../controller/certificate_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../widgets/app_button_widget.dart';

class ChangeNameWidget extends StatelessWidget {
  final String currentName;
  final String certId;

  final _formKey = GlobalKey<FormBuilderState>();

  ChangeNameWidget({super.key, required this.currentName, required this.certId});

  @override
  Widget build(BuildContext context) {
    inputDecoration(String hintText, {Widget? suffixIcon}) => InputDecoration(
        isDense: true,
        labelText: hintText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(12),
        labelStyle: const TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
        hintStyle: const TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
        fillColor: const Color(0xffF2F6FA),
        suffixIcon: suffixIcon);

    String? name = currentName;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${AppLocalizations.current.nameFor} ${AppLocalizations.current.digitalCertificate}",
                  style: const TextStyle(
                      color: Color(0xff08285C),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 26 / 18,
                      fontFamily: FontFamily.inter),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.current.nameForCTS,
                        style: const TextStyle(
                            color: Color(0xff08285C),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 24 / 14,
                            fontFamily: FontFamily.inter),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FormBuilderTextField(
                        name: 'certName',
                        initialValue: currentName,
                        // textInputAction: TextInputAction.next,
                        onChanged: (String? text) {
                          name = text;
                        },
                        decoration: inputDecoration(""),
                        style: const TextStyle(
                            color: Color(0xff08285C),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 24 / 14,
                            fontFamily: FontFamily.inter),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(256),
                        ]),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Text(
                        AppLocalizations.current.changeNameDescription,
                        style: const TextStyle(
                            color: Color(0xff08285C),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            height: 24 / 12,
                            fontFamily: FontFamily.inter),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 23,),
                Row(
                  children: [
                    Expanded(child: AppButtonWidget(
                      label: AppLocalizations.current.cancel,
                      labelColor: const Color(0xff0D75D6),
                      backgroundColor: const Color(0xffE0F0FF),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),),
                    const SizedBox(width: 16,),
                    Expanded(child: AppButtonWidget(
                      label: AppLocalizations.current.confirm,
                      onTap: () {
                        debugPrint(name ?? "null");
                        bool valid = _formKey.currentState?.fields["certName"]?.validate() ?? false;
                        debugPrint(valid.toString());
                        if (valid) {
                          Navigator.pop(context);
                          // change cts name
                          final controller = Get.find<CertificateController>();
                          controller.changeName(certId, name!);
                        }
                        // Navigator.pop(context);
                      },
                    ),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
