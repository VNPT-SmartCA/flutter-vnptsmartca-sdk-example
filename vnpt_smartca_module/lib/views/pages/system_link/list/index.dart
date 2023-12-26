// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:scale_size/scale_size.dart';
import '../../../../core/extensions/datetime.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';

import '../../../../configs/injector/injector.dart';
import '../../../../../core/extensions/datetime_format.dart';
import '../../../../../core/models/response/link_system_response.dart';
import '../../../../../core/services/user_info_on_device.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../controller/system_link_controller.dart';
import '../../../utils/config_input_decoration.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_loading.dart';

const STATUS_VIEW_WAITING_CONFIRM = "waiting_confirm";
const STATUS_VIEW_WAITING_CONFIG = "waiting_config";
const STATUS_VIEW_LINKED = "linked";
const STATUS_VIEW_PAUSING = "pausing";

class ListSystemLinkPage extends StatefulWidget {
  final String idCert;

  const ListSystemLinkPage({super.key, required this.idCert});

  @override
  State<StatefulWidget> createState() => ListSystemLinkState();
}

class ListSystemLinkState extends State<ListSystemLinkPage> {
  final controller = Get.put(SystemLinkController());

  bool showViewConfig = false;
  bool? configByTime;
  bool? isOnDemand;

  bool showViewDelete = false;

  TextEditingController datetimeConfigTEC = TextEditingController();
  DateTime dateTimeConfig = DateTime.now();
  TimeOfDay timeConfig = TimeOfDay.now();

  List<LinkSystemModel> listLinkSystem = [];
  int indexLinkSelected = 0;

  @override
  void initState() {
    super.initState();
    controller.getList3rdLinks(widget.idCert);
  }

  @override
  Widget build(BuildContext context) {
    controller.listLinkSystem.listen((model) {
      if (model.isNotEmpty) {
        setState(() {
          listLinkSystem = controller.listLinkSystem.value;
        });
      }
    });
    controller.linkUpdatedByConfigTime.listen((model) {
      if (model != null) {
        listLinkSystem[indexLinkSelected] = model;
        listLinkSystem[indexLinkSelected].statusView = STATUS_VIEW_LINKED;
        controller.linkUpdatedByConfigTime.value = null;
      }
      setState(() {});
    });
    controller.linkUpdatedByConfigDemand.listen((model) {
      if (model != null) {
        listLinkSystem[indexLinkSelected] = model;
        listLinkSystem[indexLinkSelected].statusView = model.permanent == false
            ? STATUS_VIEW_WAITING_CONFIG
            : STATUS_VIEW_LINKED;
        controller.linkUpdatedByConfigDemand.value = null;
      }
      setState(() {});
    });
    controller.linkUpdatedByPause.listen((model) {
      if (model != null) {
        listLinkSystem[indexLinkSelected] = model;
        listLinkSystem[indexLinkSelected].statusView =
            model.isPause == true ? STATUS_VIEW_PAUSING : STATUS_VIEW_LINKED;
        controller.linkUpdatedByPause.value = null;
      }
      setState(() {});
    });
    return BaseScreen(
      title: AppLocalizations.current.listLinkSystem,
      colorBg: Color(0xffF0F4F9),
      loadingWidget: BaseLoading<SystemLinkController>(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                child: listLinkSystem.isNotEmpty
                    ? BaseText(
                        AppLocalizations.current.desListLinkSystem,
                        height: 24 / 14,
                        color: const Color(0xff08285C),
                        fontWeight: FontWeight.w500,
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            // todo
                          });
                        },
                        child: RichText(
                          text: TextSpan(
                            text: AppLocalizations.current.noSystemsLinkYet,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff08285C),
                              fontFamily: FontFamily.inter,
                              height: 24 / 14,
                            ),
                            children: [
                              TextSpan(
                                text: AppLocalizations.current.here,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.inter,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0D75D6),
                                  height: 24 / 14,
                                ),
                              ),
                              TextSpan(
                                text: AppLocalizations
                                    .current.toPerformSystemLinking,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.inter,
                                  color: Color(0xff08285C),
                                  height: 24 / 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: 1.width,
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: 20),
                    itemBuilder: (_, index) {
                      return systemLinkWidget(index);
                    },
                    separatorBuilder: (_, index) {
                      return SizedBox(height: 15);
                    },
                    itemCount: listLinkSystem.length,
                  ),
                ),
              )
            ],
          ),
          showViewConfig ? showConfig() : Container(),
          showViewDelete ? showDelete() : Container(),
        ],
      ),
    );
  }

  String getTextStatus(String status) {
    switch (status) {
      case STATUS_VIEW_WAITING_CONFIRM:
        return AppLocalizations.current.waitingForSignerConfirm;
      case STATUS_VIEW_WAITING_CONFIG:
        return AppLocalizations.current.waitingConfig;
      case STATUS_VIEW_LINKED:
        return AppLocalizations.current.linking;
      case STATUS_VIEW_PAUSING:
        return AppLocalizations.current.pause;
      default:
        return "";
    }
  }

  Color getColorTextStatus(String status) {
    switch (status) {
      case STATUS_VIEW_WAITING_CONFIRM:
        return Color(0xffFF9843);
      case STATUS_VIEW_WAITING_CONFIG:
        return Color(0xff784FFF);
      case STATUS_VIEW_LINKED:
        return Color(0xff17A514);
      case STATUS_VIEW_PAUSING:
        return Color(0xffE51F1F);
      default:
        return Color(0xffFFFFFF);
    }
  }

  Widget systemLinkWidget(int index) {
    LinkSystemModel systemModel = listLinkSystem[index];
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: BaseText(
                  systemModel.clientName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  maxLines: 1,
                ),
              ),
              Container(
                width: 80,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ([STATUS_VIEW_WAITING_CONFIRM, STATUS_VIEW_WAITING_CONFIG]
                            .contains(systemModel.statusView))
                        ? SizedBox()
                        : InkWell(
                            onTap: () async {
                              String totp = await controller.getTOTP(widget.idCert);
                              controller.pauseLifeTime3rdLink(
                                systemModel.id,
                                systemModel.statusView != STATUS_VIEW_PAUSING,
                                totp,
                              );
                            },
                            child: systemModel.statusView == STATUS_VIEW_PAUSING
                                ? Assets.images.icPlayCircle.image(
                                    fit: BoxFit.fitHeight,
                                  )
                                : Assets.images.icPauseCircle.image(
                                    fit: BoxFit.fitHeight,
                                  )),
                    Expanded(
                      child: Center(
                        child: Container(
                          width: 1,
                          color: Color(([
                            STATUS_VIEW_WAITING_CONFIRM,
                            STATUS_VIEW_WAITING_CONFIG
                          ].contains(systemModel.statusView))
                              ? 0xffFFFFFF
                              : 0xffA5B0C2),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          indexLinkSelected = index;
                          showViewDelete = true;
                        });
                      },
                      child: Assets.images.icTrashRed.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          BaseText(
            getTextStatus(systemModel.statusView ?? ""),
            fontWeight: FontWeight.w500,
            maxLines: 1,
            color: getColorTextStatus(systemModel.statusView ?? ""),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: BaseText(
                  systemModel.createTime?.split(" ")[0],
                  color: Color(0xff5768A5),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (systemModel.statusView == STATUS_VIEW_WAITING_CONFIRM) {
                    String totp = await controller.getTOTP(widget.idCert);
                    controller.reLink3rd(systemModel.id, totp);
                  } else {
                    setState(() {
                      indexLinkSelected = index;
                      showViewConfig = true;
                    });
                  }
                },
                child: SizedBox(
                  width: 100,
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        systemModel.statusView == STATUS_VIEW_WAITING_CONFIRM
                            ? AppLocalizations.current.confirm
                            : AppLocalizations.current.config,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff0D75D6),
                      ),
                      Assets.images.icArrowRight.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showConfig() {
    if (configByTime == null) {
      configByTime = listLinkSystem[indexLinkSelected].configMode == "time";
    }
    if (isOnDemand == null) {
      isOnDemand = listLinkSystem[indexLinkSelected].permanent ?? true;
    }
    if (listLinkSystem[indexLinkSelected].validTo != null) {
      dateTimeConfig = DatetimeFormat.stringToDate(
          listLinkSystem[indexLinkSelected].validTo,
          format: "dd/MM/yyyy HH:mm:ss");
      timeConfig =
          TimeOfDay(hour: dateTimeConfig.hour, minute: dateTimeConfig.minute);
    }
    datetimeConfigTEC.text =
        dateTimeConfig.fromDate(format: "dd/MM/yyyy HH:mm:ss");
    return Container(
      height: 1.height,
      alignment: Alignment.bottomCenter,
      color: Colors.black.withOpacity(0.3),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        AppLocalizations.current.configAutomaticCharacters,
                        color: Color(0xff08285C),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            showViewConfig = false;
                            configByTime = null;
                            isOnDemand = null;
                          });
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.centerRight,
                          child: Assets.images.icClose.svg(
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  color: Color(0xffE0E0E0),
                  height: 1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: InkWell(
                              onTap: () {
                                if (configByTime == false) {
                                  setState(() {
                                    configByTime = true;
                                  });
                                }
                              },
                              child: configByTime == true
                                  ? Assets.images.icCheckedCircle.image()
                                  : Assets.images.icUncheckCircle.image(),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  AppLocalizations
                                      .current.accordingToInstallationTime,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 10),
                                BaseText(
                                  AppLocalizations.current.whenTheTermExpires,
                                ),
                                SizedBox(height: 15),
                                BaseText(
                                  AppLocalizations.current.timeToDate,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 10),
                                Stack(
                                  children: [
                                    FormBuilderTextField(
                                      name: 'datetimeConfig',
                                      readOnly: true,
                                      controller: datetimeConfigTEC,
                                      decoration:
                                          ConfigInputDecoration().config(
                                        "",
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Assets.images.icCalendar.image(
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.fitHeight),
                                          color: Color(0xff0D75D6),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (configByTime == false) return;
                                        final now = DateTime.now();
                                        final date = await showDatePicker(
                                          context: context,
                                          initialDate: dateTimeConfig,
                                          firstDate: now,
                                          lastDate: DateTime(now.year + 15,
                                              now.month, now.day),
                                          // lastDate: DateTime(now.year, now.month, now.day + 2),
                                        );
                                        if (date == null) return;

                                        if (!mounted) return;

                                        final time = await showTimePicker(
                                          context: context,
                                          initialTime: timeConfig,
                                        );

                                        if (time == null) return;
                                        timeConfig = time;

                                        dateTimeConfig = DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            time.hour,
                                            time.minute);
                                        datetimeConfigTEC.text =
                                            dateTimeConfig.fromDate(
                                                format: "dd/MM/yyyy HH:mm:ss");
                                      },
                                      child:
                                          SizedBox(width: 1.width, height: 45),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: InkWell(
                              onTap: () {
                                if (configByTime == true) {
                                  setState(() {
                                    configByTime = false;
                                  });
                                }
                              },
                              child: configByTime == true
                                  ? Assets.images.icUncheckCircle.image()
                                  : Assets.images.icCheckedCircle.image(),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  AppLocalizations
                                      .current.accordingToUsageNeeds,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 10),
                                BaseText(
                                  AppLocalizations
                                      .current.theSystemWillAutomaticallySign,
                                ),
                                SizedBox(height: 15),
                                Container(
                                  width: 170,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Color(0xffC9CED7)),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            if (configByTime == false &&
                                                isOnDemand == false) {
                                              setState(() {
                                                isOnDemand = true;
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(isOnDemand == true
                                                  ? 0xff0D75D6
                                                  : 0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: BaseText(
                                                AppLocalizations.current.turnOn,
                                                color: Color(isOnDemand == true
                                                    ? 0xffFFFFFF
                                                    : 0xff5768A5),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            if (configByTime == false &&
                                                isOnDemand == true) {
                                              setState(() {
                                                isOnDemand = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(isOnDemand == true
                                                  ? 0xffFFFFFF
                                                  : 0xff0D75D6),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: BaseText(
                                                AppLocalizations
                                                    .current.turnOff,
                                                color: Color(isOnDemand == true
                                                    ? 0xff5768A5
                                                    : 0xffFFFFFF),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      AppButtonWidget(
                        label: AppLocalizations.current.confirm,
                        doublePadding: 15,
                        onTap: () async {
                          String totp = await controller.getTOTP(widget.idCert);
                          if (configByTime == true) {
                            controller.configLifeTime3rdLink(
                                listLinkSystem[indexLinkSelected].id,
                                dateTimeConfig.millisecondsSinceEpoch,
                                totp);
                          } else {
                            controller.set3rdLinkMode(
                                listLinkSystem[indexLinkSelected].id,
                                isOnDemand ?? false,
                                totp);
                          }
                          setState(() {
                            showViewConfig = false;
                            configByTime = null;
                            isOnDemand = null;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showDelete() {
    return Container(
      height: 1.height,
      alignment: Alignment.bottomCenter,
      color: Colors.black.withOpacity(0.3),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        AppLocalizations.current.deleteLinkSystem,
                        color: Color(0xff08285C),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            showViewDelete = false;
                          });
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.centerRight,
                          child: Assets.images.icClose.svg(
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  color: Color(0xffE0E0E0),
                  height: 1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      BaseText(
                        AppLocalizations.current.agreeRemoveLinkSystem(
                            listLinkSystem[indexLinkSelected].clientName ?? ''),
                        fontSize: 15,
                      ),
                      SizedBox(height: 5),
                      BaseText(
                        AppLocalizations.current.ifDeletePleaseMake(
                            listLinkSystem[indexLinkSelected].clientName ?? ''),
                        fontSize: 15,
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: AppButtonWidget(
                              label: AppLocalizations.current.cancel,
                              doublePadding: 15,
                              labelColor: Color(0xff0D75D6),
                              backgroundColor: Color(0xffE0F0FF),
                              onTap: () {
                                setState(() {
                                  showViewDelete = false;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: AppButtonWidget(
                              label: AppLocalizations.current.confirm,
                              doublePadding: 15,
                              onTap: () {
                                setState(() {
                                  showViewDelete = false;
                                  controller.deleteLink3rd(
                                      listLinkSystem[indexLinkSelected].id);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
