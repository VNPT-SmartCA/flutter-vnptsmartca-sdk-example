// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../configs/app_config.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/auth_controller.dart';
import '../../controller/login_controller.dart';
import '../../i18n/generated_locales/l10n.dart';

import '../forgot_password/index.dart';
import '../register_account/register_account/index.dart';
import 'list_accounts.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();
  final authController = Get.find<AuthController>();
  final passwordMaxLength = 50;
  final usernameMaxLength = 30;

  final inputDecoration = (String hintText, {Widget? suffixIcon}) => InputDecoration(
      isDense: true,
      labelText: hintText,
      hintText: hintText,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      counterText: "",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
      filled: true,
      contentPadding: EdgeInsets.all(12),
      labelStyle: TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
      hintStyle: TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
      fillColor: Color(0xffF2F6FA),
      suffixIcon: suffixIcon);

  @override
  Widget build(BuildContext context) {
    final widgets = [
      SizedBox(height: 16),
      Text(
        AppLocalizations.current.username,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 6),
      FormBuilderTextField(
        name: 'uid',
        maxLength: usernameMaxLength,
        textInputAction: TextInputAction.next,
        decoration: inputDecoration(AppLocalizations.current.usernamePlacehoder),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: AppLocalizations.current.inputRequired(AppLocalizations.current.username)),
          FormBuilderValidators.maxLength(usernameMaxLength,
              errorText: AppLocalizations.current.maxLength(usernameMaxLength)),
        ]),
      ),
    ];

    return GestureDetector(
      // ignore: prefer-extracting-callbacks
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 46),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
            padding: EdgeInsets.only(left: 16, right: 16, top: 93, bottom: 16),
            // width: Get.size.width - 32,
            child: FormBuilder(
              key: controller.formKey,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOTE: ----- Hiển thị danh sách tài khoản -----
                    if (controller.userInfoList.value.isNotEmpty) ListAccounts(),
                    //NOTE: ----- Hiển thị nhập số định danh -----
                    if (controller.showUsernameInput.value) ...widgets,
                    SizedBox(height: 16),
                    //NOTE: ----- Hiển thị nhập password -----
                    Text(
                      AppLocalizations.current.password,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 6),
                    FormBuilderTextField(
                      name: 'password',
                      obscureText: controller.obscureText.value,
                      onSubmitted: (value) => controller.onFormSubmit(),
                      textInputAction: TextInputAction.done,
                      maxLength: passwordMaxLength,
                      decoration: inputDecoration(
                        AppLocalizations.current.password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.obscureText.value = !controller.obscureText.value;
                          },
                          icon: Icon(controller.obscureText.value ? Icons.visibility : Icons.visibility_off),
                          color: Color(0xff5768A5),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: AppLocalizations.current.inputRequired(AppLocalizations.current.password)),
                        FormBuilderValidators.maxLength(passwordMaxLength,
                            errorText: AppLocalizations.current.maxLength(passwordMaxLength)),
                      ]),
                    ),
                    // END Nhập thông tin
                    Align(
                      child: TextButton(
                          onPressed: () {
                            Get.to(() => ForgotPasswordPage());
                          },
                          child: Text(AppLocalizations.current.forgotPassword)),
                      alignment: Alignment.centerRight,
                    ),
                    SizedBox(height: 30),
                    //NOTE: ----- LOGIN BUTTON -----
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff0D75D6),
                              minimumSize: const Size.fromHeight(48),
                              shadowColor: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: authController.currentUser.value?.useBiometric == true
                                    ? BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
                                    : BorderRadius.circular(8), // <-- Radius
                              ),
                            ),
                            child: Text(AppLocalizations.current.signIn),
                            onPressed: controller.onFormSubmit,
                          ),
                        ),
                        if (authController.currentUser.value?.useBiometric == true) SizedBox(width: 1),
                        if (authController.currentUser.value?.useBiometric == true)
                          InkWell(
                            onTap: controller.loginWithBiometric,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xff0D75D6),
                                  borderRadius:
                                      BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                ),
                                height: 48,
                                child: Assets.images.faceId.svg(package: AppConfig.package)),
                          )
                      ],
                    ),

                    SizedBox(height: 16),
                    //NOTE: ----- Register Cert -----
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${AppLocalizations.current.noAccount}? "),
                          TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Get.to(() => RegisterAccountPage());
                              },
                              child: Text(AppLocalizations.current.createAccount))
                        ],
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    SizedBox(height: 32),
                    // Help
                    Align(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                          textStyle: TextStyle(color: Color(0xff1262CC)),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () async =>
                            await launchUrl(mode: LaunchMode.externalApplication, Uri.parse(AppConfig.featuresLink)),
                        icon: Icon(Icons.help_outline),
                        label: Text(
                          AppLocalizations.current.userManual,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Assets.images.smartcaLogo.svg(height: 118, package: AppConfig.package),
        ],
      ),
    );
  }
}
