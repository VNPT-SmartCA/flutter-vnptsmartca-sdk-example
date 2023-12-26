import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/models/response/order_cert_model.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/enter_info_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../active_account/bottom_contact.dart';
import '../../widgets/widget.dart';

import '../../../core/models/response/profile_model.dart';

class PaymentScreen extends StatefulWidget {
  final OrderCertModel orderCertModel;
  final ProfileModel profileModel;
  final String? raCode;

  const PaymentScreen({super.key, required this.orderCertModel, required this.profileModel, required this.raCode});

  @override
  State<StatefulWidget> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final controller = Get.put(EnterInfoController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      controller.paymentOrderV2(widget.orderCertModel, widget.orderCertModel.pricing.price == 0, widget.raCode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.serviceInitialization,
      body: Column(
        children: [
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
                          title: AppLocalizations.current.initializingTheService,
                          subtitle: AppLocalizations.current.theSystemIsInitializingTheServicePleaseWaitAMoment,
                        ),
                      );
                    }
                    return const SizedBox();
                  })
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
          items: listImage.map((item) => item.image(fit: BoxFit.fill)).toList(),
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
          ),
        ),
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
