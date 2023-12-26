import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/app_config.dart';
import '../../../../core/models/response/certificate_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/generate_cer_key_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';
import '../../../widgets/loading_circle_widget.dart';
import '../bottom_contact.dart';
import '../header_step.dart';


class GenerateCerKeyPage extends StatefulWidget {
  final CertificateModel  certificateModel;
  final String? pin;
  final String? otp;

  const GenerateCerKeyPage({Key? key,required this.certificateModel, this.pin, this.otp})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GenerateCerKeyState();
}

class _GenerateCerKeyState extends State<GenerateCerKeyPage> {
  late GenerateCerKeyController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(GenerateCerKeyController(
        certificateModel: widget.certificateModel, pin: widget.pin, otp: widget.otp));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.checkCertStatus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.exitLoop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.isFirst);
        return true;
      },
      child: Obx(() {
        return BaseScreen(
          title: (controller.processDesc.value != null &&
                  (controller.processDesc.value?.isSuccess ?? false))
              ? AppLocalizations.current.orderAPPROVE_REQUEST_CERT_WAITING
              : AppLocalizations.current.generateCerKey,
          onBackPress: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          body: Column(
            children: [
              HeaderStep(
                step: 2,
                customImageStep: Assets.images.stepTwoNew,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const ImageSliderWidget(),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Container(
                            margin: const EdgeInsets.only(top: 60, bottom: 20),
                            child: LoadingCircleWidget(
                              title: AppLocalizations.current.initializingKeyPair,
                              subtitle: AppLocalizations
                                  .current.initializingKeyPairDescription,
                            ),
                          );
                        }
                        if (controller.processDesc.value != null) {
                          if (controller.processDesc.value?.isSuccess ?? false) {
                            return Container(
                              margin: const EdgeInsets.only(top: 60, bottom: 20),
                              child: Column(
                                children: [
                                  Assets.images.icDialogSuccess.image(width: 100),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: BaseText(
                                      AppLocalizations
                                          .current.waitingForApprovalTitle,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.center,
                                      height: 24 / 16,
                                      color: const Color(0xff08285C),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    child: BaseText(
                                      AppLocalizations.current.waitingCapCTS,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      textAlign: TextAlign.center,
                                      height: 24 / 14,
                                      textOverflow: TextOverflow.visible,
                                      color: const Color(0xffED1C24),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return renderInfoBody(controller.processDesc.value!);
                          }
                        }
                        return const SizedBox();
                      })
                    ],
                  ),
                ),
              ),
              Obx(() {
                return Visibility(
                  visible: !controller.isLoading.value,
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: AppButtonWidget(
                        label: AppLocalizations.current.iUnderstand,
                        onTap: () {
                          // todo
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      )),
                );
              }),
              const BottomContact(),
            ],
          ),
        );
      }),
    );
  }

  renderInfoBody(ProcessDescModel value) {
    return InfoNotifyWidget(
      title: value.title,
      content: value.content,
      image: value.isSuccess
          ? Assets.images.icDialogSuccess.path
          : Assets.images.icDialogFail.path,
    );
  }
}

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({super.key});

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int currentPage = 0;
  var listImage = [
    Assets.images.icBaner1,
    Assets.images.icBaner2,
    Assets.images.icBaner3,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: listImage
                .map((item) => item.image(
                      fit: BoxFit.fill,
                    ))
                .toList(),
            options: CarouselOptions(
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                setState(() {
                  currentPage = index;
                });
              },
              autoPlay: true,
              aspectRatio: 16 / 9,
              height: 160,
              viewportFraction: 0.8,
              enlargeFactor: 0.2,
              enlargeCenterPage: true,
            )),
        const SizedBox(height: 15),
        renderIndicator()
      ],
    );
  }

  Widget renderIndicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listImage.map((e) {
          int index = listImage.indexOf(e);
          Color color = const Color(0xffCFE3F7);
          if (index == currentPage) {
            color = const Color(0xff0D75D6);
          }
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          );
        }).toList());
  }
}

class InfoNotifyWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String content;
  final EdgeInsets? margin;

  const InfoNotifyWidget(
      {Key? key, this.image, this.title, required this.content, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          if (image?.isNotEmpty ?? false)
            Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Image.asset(
                  image!,
                  width: 100,
                  package: AppConfig.package,
                )),
          if (title?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: BaseText(
                title,
                fontSize: 16,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: const Color(0xff08285C),
                textAlign: TextAlign.center,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: BaseText(
              content,
              fontSize: 14,
              height: 1.4,
              fontWeight: FontWeight.w400,
              color: const Color(0xff08285C),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
