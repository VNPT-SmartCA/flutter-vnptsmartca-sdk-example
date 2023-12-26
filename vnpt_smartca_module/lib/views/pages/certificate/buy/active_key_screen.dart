import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../configs/app_config.dart';
import '../../../../gen/assets.gen.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';
import '../../../widgets/loading_circle_widget.dart';
import '../../active_account/bottom_contact.dart';
import '../../active_account/header_step.dart';

class ActiveKeyScreen extends StatefulWidget {
  // final CertificateModel? certificateModel;

  const ActiveKeyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GenerateCerKeyState();
}

class _GenerateCerKeyState extends State<ActiveKeyScreen> {
  // late GenerateCerKeyController controller;

  @override
  void initState() {
    super.initState();
    // controller = Get.put(GenerateCerKeyController(certificateModel: widget.certificateModel));
    // controller.getInfoApproved();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.generateCerKey,
      hiddenIconBack: true,
      body: Column(
        children: [
          HeaderStep(step: 2, customImageStep: Assets.images.stepTwoNew,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const ImageSliderWidget(),
                  Container(
                    margin: const EdgeInsets.only(top: 60, bottom: 20),
                    child: LoadingCircleWidget(
                      title: AppLocalizations.current.initializingKeyPair,
                      subtitle: AppLocalizations.current.initializingKeyPairDescription,
                    ),
                  )
                ],
              ),
            ),
          ),
          const BottomContact(),
        ],
      ),
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

  const InfoNotifyWidget({Key? key, this.image, this.title, required this.content, this.margin}) : super(key: key);

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
