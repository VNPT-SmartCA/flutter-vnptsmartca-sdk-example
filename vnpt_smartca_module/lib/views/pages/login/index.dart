// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vnpt_smartca_module/views/i18n/generated_locales/l10n.dart';
import '../../../configs/app_config.dart';
import '../../controller/login_controller.dart';

import '../../../gen/assets.gen.dart';
import '../../widgets/navigator_helper.dart';
import 'bottom_logo.dart';
import 'language.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: SingleChildScrollView(
            primary: true,
            child: Container(
                height: Get.size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: Assets.images.background
                      .image(package: AppConfig.package)
                      .image,
                  fit: BoxFit.fill,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Expanded(
                    //     child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     TextButton.icon(
                    //         style: TextButton.styleFrom(
                    //             textStyle: TextStyle(
                    //                 color: Colors.white, fontSize: 16),
                    //             backgroundColor: Colors.transparent,
                    //             foregroundColor: Colors.white),
                    //         onPressed: () => {NavigatorHandler.closeSDK()},
                    //         icon: Icon(Icons.arrow_back,
                    //             color: Colors.white, size: 28),
                    //         label: Text(AppLocalizations.current.back)),
                    SizedBox(height: 25),
                    Expanded(child: LanguageItem()),
                    //   ],
                    // )),
                    LoginForm(),
                    Expanded(child: BottomLogo()),
                  ],
                )),
          ),
        ));
  }
}
