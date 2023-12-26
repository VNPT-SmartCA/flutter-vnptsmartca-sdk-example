// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../i18n/generated_locales/l10n.dart';
import 'app_button_widget.dart';

class UpdateAppWidget extends StatelessWidget {
  final String? title;
  final String content;
  final AssetGenImage? image;
  final bool onlyActionCancel;
  final bool onlyActionAccept;
  final String? titleBtnCancel;
  final String? titleBtnAccept;
  final Function? actionCancel;
  final Function? actionAccept;
  final TextAlign? contentAlign;

  const UpdateAppWidget(
      {super.key,
      this.title,
      required this.content,
      this.image,
      this.onlyActionCancel = false,
      this.onlyActionAccept = false,
      this.titleBtnCancel,
      this.titleBtnAccept,
      this.actionCancel,
      this.actionAccept,
      this.contentAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * .45,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          image!.image(height: 90, fit: BoxFit.fill),
          SizedBox(height: 20),
          Text(
            title ?? "${AppLocalizations.current.Notice}!",
            style: const TextStyle(
              color: Color(0xff08285C),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xff08285C),
                    fontSize: 14.5,
                    height: 1.3,
                  ),
                )),
          ),
          SizedBox(height: 23),
          Row(
            children: [
              Expanded(
                child: AppButtonWidget(
                  label: titleBtnCancel ?? AppLocalizations.current.close,
                  labelColor: const Color(0xff0D75D6),
                  backgroundColor: const Color(0xffE0F0FF),
                  onTap: () {
                    Navigator.pop(context);
                    actionCancel?.call();
                  },
                ),
              ),
              SizedBox(width: (onlyActionCancel || onlyActionAccept) ? 0 : 16),
              Expanded(
                child: AppButtonWidget(
                  label: titleBtnAccept ?? AppLocalizations.current.confirm,
                  onTap: () {
                    Navigator.pop(context);
                    actionAccept?.call();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
