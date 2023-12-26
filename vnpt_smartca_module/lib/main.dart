// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scale_size/scale_size.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:vnpt_smartca_module/views/widgets/navigator_helper.dart';

import 'app_wrapper.dart';
import 'configs/app_config.dart';
import 'configs/injector/injector.dart';
import 'core/models/app/smartca_message_result.dart';
import 'core/utils/constants.dart';
import 'core/utils/language_enums.dart';
import 'gen/assets.gen.dart';
import 'method_channel_handler.dart';
import 'views/bindings/app.bindings.dart';
import 'views/i18n/generated_locales/l10n.dart';
import 'views/routes/app_pages.dart';

main() async {
  // Errors not caught by Flutter
  runZonedGuarded(() async {
    await bootstrapSmartCAApp();
  }, (Object error, StackTrace stack) {
    debugPrint("error log ${error}");
  });
}

bootstrapSmartCAApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Errors caught by Flutter
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  final MethodChannelHandler methodChannelHandler = MethodChannelHandler();

  /// Call về app tích hợp khi app đã load xong
  methodChannelHandler.send(
    method: MethodChannelNames.isReady,
    data: SmartCaResult(ResultCode.SUCCESS_CODE, ResultCodeDesc.SUCCESS),
  );

  /// Khi có sự kiện configure thì mới tiến hành khởi tạo app
  methodChannelHandler.listen(
      method: MethodChannelNames.configure,
      listener: (event) async {
        final param = jsonDecode(event);

        AppConfig.environment = (param['env'] as int) == PROD_ENV ? Environment.prod : Environment.dev;

        AppConfig.language = (param['lang'] as String) == AppLanguage.en ? AppLanguage.en : AppLanguage.vi;

        AppConfig.isFlutter = param['isFlutter']  ?? true;
        
        // Cấu hình các thành phần phụ thuộc
        await configureDependencies(AppConfig.environment);
        // PushNotificationManager.instance.initFirebase();

        // /// Cấu hình status bar
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ));

        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
        ]);

        runApp(
          Material(
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                GetMaterialApp(
                  // color: Colors.white,
                  home: Builder(builder: (context) {
                    ScaleSize.init(context, designWidth: 375);
                    return Stack(
                      children: [
                        Scaffold(
                          resizeToAvoidBottomInset: true,
                          // backgroundColor: Colors.white,
                          body: Stack(
                            children: [
                              AppWrapper(),
                              if (AppConfig.environment == Environment.dev)
                                const Banner(
                                  message: 'Demo',
                                  location: BannerLocation.topStart,
                                  color: Colors.red,
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                  // khởi tạo các controller, thành phần phụ thuộc khác
                  initialBinding: AppBinding(),
                  themeMode: ThemeMode.light,
                  theme: ThemeData(
                    fontFamily: AppConfig.fontFamily,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  defaultTransition: Transition.noTransition,
                  locale: Locale(AppConfig.language),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    AppLocalizations.delegate,
                    FormBuilderLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.delegate.supportedLocales,
                  getPages: AppPages.routes,
                ),
                Builder(builder: (context) {
                  ScaleSize.init(context, designWidth: 375);
                  return GestureDetector(
                    onTap: () {
                      if (Get.context != null) {
                        Navigator.popUntil(Get.context!, (route) => route.isFirst);
                        NavigatorHandler.closeSDK();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 1.top),
                      padding: EdgeInsets.only(right: 10),
                      height: kToolbarHeight,
                      width: 50,
                      alignment: Alignment.centerRight,
                      child: Assets.images.close.svg(
                        width: 30,
                        height: 30
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      });
}
