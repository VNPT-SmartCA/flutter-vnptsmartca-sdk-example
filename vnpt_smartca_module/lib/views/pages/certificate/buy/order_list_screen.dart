// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../../core/models/response/order_cert_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/common.dart';
import '../../../utils/config_input_decoration.dart';
import '../../../utils/datetime_format.dart';
import '../../../widgets/app_refresh.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/widget.dart';

import 'order_detail_screen.dart';
import '../../../../core/extensions/datetime.dart';

class OrderListScreen extends StatefulWidget {
  final bool hiddenBack;
  final Color? appBarColor;
  final Color? appBarBoxShadowColor;
  const OrderListScreen({super.key, this.hiddenBack = false, this.appBarColor, this.appBarBoxShadowColor});

  @override
  State<StatefulWidget> createState() {
    return _OrderListScreenState();
  }
}

enum _ListPageStatus { all, inProgress, done, canceled }

class _OrderListScreenState extends State<OrderListScreen> {
  int _index = 0;

  @override
  void initState() {
    Get.put(BuyCertificateController());
    debugPrint(DateTime.now().toString());
    debugPrint(DateTime.now().toIso8601String());
    super.initState();
  }

  AppRefreshController appRefreshControllerAll = AppRefreshController();
  AppRefreshController appRefreshControllerInProgress = AppRefreshController();
  AppRefreshController appRefreshControllerDone = AppRefreshController();
  AppRefreshController appRefreshControllerCanceled = AppRefreshController();

  Timer? _debounce;

  String? _searchText;
  int? _orderType;
  String? _fromDate;
  String? _toDate;

  final List<String> orderTypes = [
    AppLocalizations.current.newCertOrder,
    AppLocalizations.current.renewCertOrder,
    AppLocalizations.current.changeDeviceOrder,
    AppLocalizations.current.change_info,
  ];

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _getParam(_ListPageStatus listPageStatus) {
    List<int> statuses;
    if (listPageStatus == _ListPageStatus.all) {
      statuses = [];
    } else if (listPageStatus == _ListPageStatus.canceled) {
      statuses = [OrderCertModel.CANCELED];
    } else if (listPageStatus == _ListPageStatus.done) {
      statuses = [OrderCertModel.DONE];
    } else {
      statuses = [
        OrderCertModel.EKYC_WAITING,
        OrderCertModel.OTP_WAITING,
        OrderCertModel.PAYMENT_WATING,
        OrderCertModel.CONTRACT_CREATE_WAITING,
        OrderCertModel.CONTRACT_SIGN_WAITING,
        OrderCertModel.REQUESTCERT_WATING,
        OrderCertModel.ONEBSS_SUBMIT_WAITING,
        OrderCertModel.APPROVE_REQUEST_CERT_WAITING,
        OrderCertModel.KEY_ASSIGN_WATING,
        OrderCertModel.EKYC_ERROR,
        OrderCertModel.OTP_ERROR,
        OrderCertModel.PAYMENT_ERROR,
        OrderCertModel.CONTRACT_CREATE_ERROR,
        OrderCertModel.CONTRACT_SIGN_ERROR,
        OrderCertModel.REQUESTCERT_ERROR,
        OrderCertModel.ONEBSS_SUBMIT_ERROR,
        OrderCertModel.APPROVE_REQUEST_CERT_ERROR,
        OrderCertModel.REJECT_REQUEST_CERT,
        OrderCertModel.KEY_ASSIGN_ERROR,
        // OrderCertModel.CANCELED,
      ];
    }
    Map<String, dynamic> params = {
      "Statuses": statuses,
      "IsDesc": true,
    };
    if (_searchText != null) {
      if (_searchText!.isNotEmpty) {
        params["SearchField"] = "DHSXKDCustomerInfo.ma_gd";
        params["SearchText"] = _searchText;
      }
      // "SearchField": "DHSXKDCustomerInfo.ma_gd",
      // "SearchText": "HNI/LD/231002/00832"
      // params["text"] = _searchText;
      // if (_searchText!.isEmpty) {
      //   params["type"] = "0";
      // } else {
      //   params["type"] = "1";
      // }
    }
    if (_fromDate != null && _toDate != null) {
      try {
        DateTime? from = DatetimeFormat().parseStringToDate(_fromDate!, utc: true);
        DateTime? to = DatetimeFormat().parseStringToDate(_toDate!, utc: true);
        if (from != null && to != null) {
          from = DateTime(from.year, from.month, from.day, 0, 0, 0);
          to = DateTime(to.year, to.month, to.day, 23, 59, 59);
          params["StartDate"] = "${from.toIso8601String()}Z";
          params["EndDate"] = "${to.toIso8601String()}Z";
          // "StartDate": "2023-10-02T08:35:40.422Z",
          // "EndDate": "2023-10-02T01:35:40.422Z"
        }
      } catch (e) {
        // nothing todo
      }
    }
    if (_orderType != null) {
      params["type"] = "$_orderType";
    }
    return params;
  }

  _refreshList() {
    appRefreshControllerAll.refresh(params: _getParam(_ListPageStatus.all));
    appRefreshControllerDone.refresh(params: _getParam(_ListPageStatus.done));
    appRefreshControllerInProgress.refresh(params: _getParam(_ListPageStatus.inProgress));
    appRefreshControllerCanceled.refresh(params: _getParam(_ListPageStatus.canceled));
  }

  _checkStringIsNotEmpty(String? s) {
    if (s == null) {
      return false;
    }
    return s.isNotEmpty;
  }

  _renderItem(String name, Function? onTap) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffE7F1FB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff0D75D6))),
      child: Row(
        children: [
          BaseText(
            name,
            color: const Color(0xff0D75D6),
          ),
          const SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: () {
              onTap?.call();
            },
            child: Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              child: Assets.images.icQrClose
                  .image(fit: BoxFit.fill, height: 20, width: 20, color: const Color(0xff5768A5)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.orderList,
      hiddenIconBack: widget.hiddenBack,
      appBarColor: widget.appBarColor ?? Colors.white,
      appBarBoxShadowColor: widget.appBarBoxShadowColor,
      colorBg: const Color.fromRGBO(241, 244, 250, 1),
      loadingWidget: const BaseLoading<BuyCertificateController>(),
      body: Column(
        children: [
          FormBuilder(
            // key: controller.formKey3,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                        name: "searchText",
                        autofocus: false,
                        readOnly: false,
                        // initialValue: initValue,
                        // onSubmitted: (value) => controller.onFormSubmit(),
                        textInputAction: TextInputAction.search,
                        onChanged: (String? value) {
                          _searchText = value;
                          if (_debounce?.isActive ?? false) _debounce?.cancel();
                          _debounce = Timer(const Duration(milliseconds: 500), () {
                            _refreshList();
                          });
                        },
                        maxLength: 250,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.maxLength(250, errorText: AppLocalizations.current.maxLength(250)),
                        ]),
                        decoration: ConfigInputDecoration().config(AppLocalizations.current.enterTextToSearchOrder,
                            fillColor: Colors.white,
                            suffixIcon: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              child: Assets.images.icCertSearch.image(
                                fit: BoxFit.fill,
                                height: 20,
                                width: 20,
                              ),
                            ))),
                  ),
                  InkWell(
                    onTap: () {
                      // todo
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return Material(
                              color: Colors.transparent,
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                            ))),
                                    _FilterBoxWidget(
                                      currentType: _orderType,
                                      fromDate: _fromDate,
                                      toDate: _toDate,
                                      orderTypes: orderTypes,
                                      getFilter: (int? type, String? fromDate, String? toDate) {
                                        _orderType = type;
                                        _fromDate = fromDate;
                                        _toDate = toDate;
                                        setState(() {
                                          _refreshList();
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 8),
                      child: Assets.images.icCertFilter.image(
                        fit: BoxFit.fill,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            alignment: Alignment.centerLeft,
            // color: Colors.red,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _HeaderOption(
                      label: AppLocalizations.current.all,
                      isSelected: _index == 0,
                      onTap: () {
                        setState(() {
                          _index = 0;
                        });
                      }),
                  const SizedBox(
                    width: 8,
                  ),
                  _HeaderOption(
                      label: AppLocalizations.current.inProgress,
                      isSelected: _index == 1,
                      onTap: () {
                        setState(() {
                          _index = 1;
                        });
                      }),
                  const SizedBox(
                    width: 8,
                  ),
                  _HeaderOption(
                      label: AppLocalizations.current.completed,
                      isSelected: _index == 2,
                      onTap: () {
                        setState(() {
                          _index = 2;
                        });
                      }),
                  const SizedBox(
                    width: 8,
                  ),
                  _HeaderOption(
                      label: AppLocalizations.current.order_canceled,
                      isSelected: _index == 3,
                      onTap: () {
                        setState(() {
                          _index = 3;
                        });
                      }),
                  // const SizedBox(
                  //   width: 16,
                  // ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _orderType != null || _checkStringIsNotEmpty(_fromDate) || _checkStringIsNotEmpty(_toDate),
            child: Container(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              alignment: Alignment.centerLeft,
              // color: Colors.red,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: _orderType != null,
                      child: _renderItem(orderTypes[_orderType ?? 0], () {
                        // debugPrint("test");
                        _orderType = null;
                        setState(() {
                          _refreshList();
                        });
                      }),
                    ),
                    Visibility(
                        visible: _orderType != null,
                        child: const SizedBox(
                          width: 8,
                        )),
                    Visibility(
                      visible: _fromDate != null && _toDate != null,
                      child: _renderItem("$_fromDate - $_toDate", () {
                        // debugPrint("test");
                        _fromDate = null;
                        _toDate = null;
                        setState(() {
                          _refreshList();
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // _Note(),
          // Visibility(visible: _index == 0, child: Expanded(child: _ListPage())),
          // Visibility(visible: _index == 1, child: Expanded(child: _ListPage(isCompleted: true,))),
          Expanded(
            child: IndexedStack(
              index: _index,
              children: [
                _ListPage(
                  listPageStatus: _ListPageStatus.all,
                  appRefreshController: appRefreshControllerAll,
                ),
                _ListPage(
                  listPageStatus: _ListPageStatus.inProgress,
                  appRefreshController: appRefreshControllerInProgress,
                ),
                _ListPage(
                  listPageStatus: _ListPageStatus.done,
                  appRefreshController: appRefreshControllerDone,
                ),
                _ListPage(
                  listPageStatus: _ListPageStatus.canceled,
                  appRefreshController: appRefreshControllerCanceled,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ListPage extends StatefulWidget {
  final _ListPageStatus listPageStatus;
  final AppRefreshController? appRefreshController;

  const _ListPage({this.listPageStatus = _ListPageStatus.all, this.appRefreshController});

  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<_ListPage> with AutomaticKeepAliveClientMixin {
  _renderItemInfo(String label, String content, {Color? contentColor, FontWeight? contentFontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseText(
          label,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.left,
          color: const Color(0xff5768A5),
        ),
        SizedBox(width: 6),
        Expanded(
            child: BaseText(
          content,
          fontWeight: contentFontWeight ?? FontWeight.w400,
          textAlign: TextAlign.right,
          color: contentColor ?? const Color(0xff08285C),
        ))
      ],
    );
  }

  final controller = Get.find<BuyCertificateController>();

  getParam() {
    List<int> statuses;
    if (widget.listPageStatus == _ListPageStatus.all) {
      statuses = [];
    } else if (widget.listPageStatus == _ListPageStatus.canceled) {
      statuses = [OrderCertModel.CANCELED];
    } else if (widget.listPageStatus == _ListPageStatus.done) {
      statuses = [OrderCertModel.DONE];
    } else {
      statuses = [
        OrderCertModel.EKYC_WAITING,
        OrderCertModel.OTP_WAITING,
        OrderCertModel.PAYMENT_WATING,
        OrderCertModel.CONTRACT_CREATE_WAITING,
        OrderCertModel.CONTRACT_SIGN_WAITING,
        OrderCertModel.REQUESTCERT_WATING,
        OrderCertModel.ONEBSS_SUBMIT_WAITING,
        OrderCertModel.APPROVE_REQUEST_CERT_WAITING,
        OrderCertModel.KEY_ASSIGN_WATING,
        OrderCertModel.EKYC_ERROR,
        OrderCertModel.OTP_ERROR,
        OrderCertModel.PAYMENT_ERROR,
        OrderCertModel.CONTRACT_CREATE_ERROR,
        OrderCertModel.CONTRACT_SIGN_ERROR,
        OrderCertModel.REQUESTCERT_ERROR,
        OrderCertModel.ONEBSS_SUBMIT_ERROR,
        OrderCertModel.APPROVE_REQUEST_CERT_ERROR,
        OrderCertModel.REJECT_REQUEST_CERT,
        OrderCertModel.KEY_ASSIGN_ERROR,
        // OrderCertModel.CANCELED,
      ];
    }
    return {
      "Statuses": statuses,
      "IsDesc": true,
    };
  }

  getStatusColor(OrderCertModel orderCertModel) {
    if (orderCertModel.status == OrderCertModel.DONE) {
      return const Color(0xff17A514);
    } else if (orderCertModel.status == OrderCertModel.CANCELED) {
      return const Color(0xffE51F1F);
    } else {
      return const Color(0xffDB7269);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint("test");
    // return SingleChildScrollView(
    //   child: Column(
    //     children: List.generate(100, (index) => Container(
    //         width: 100, height: 100,
    //       child: BaseText(index.toString()),
    //     )).toList(),
    //   ),
    // );
    return AppRefresh<OrderCertModel>(
      path: "/order/certorder/listCertOrder",
      fromMap: OrderCertModel.fromJson,
      appRefreshController: widget.appRefreshController,
      keyController: "listCertOrder${widget.listPageStatus.toString()}_${Common.getRandomString(6)}",
      itemWidgetBuilder: (v, index) {
        return Obx(() {
          OrderCertModel value = v.orderItemController!.currentOrderCertModel.value!;
          return InkWell(
            onTap: () {
              // if (value.type != 0) {
              //   return;
              // }
              // if (widget.listPageStatus != _ListPageStatus.done) {
              //   controller.handleOrderModelByStatus(value);
              // }
              if (value.canContinue()) {
                controller.handleOrderModelByStatus(value);
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 9,
                left: 9,
              ),
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  boxShadow: [
                    // BoxShadow(
                    //     blurRadius: 10,
                    //     spreadRadius: 0,
                    //     offset: const Offset(0, 1),
                    //     color: const Color(0xff1A3478).withOpacity(0.1))
                  ]),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
                    ),
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                            child: BaseText(
                          value.getTypeLabel(),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xff0D75D6),
                        )),
                        Assets.images.icArrowRight.image(width: 16, height: 16, fit: BoxFit.cover)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: Stack(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              color: Colors.white,
                            ),
                            Container(
                              width: 14,
                              height: 14,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(241, 244, 250, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(14), bottomRight: Radius.circular(14))),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.white,
                        height: 14,
                        alignment: Alignment.center,
                        child: Assets.images.icLine.image(fit: BoxFit.fitWidth),
                      )),
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: Stack(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              color: Colors.white,
                            ),
                            Container(
                              width: 14,
                              height: 14,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(241, 244, 250, 1),
                                  borderRadius:
                                      BorderRadius.only(topLeft: Radius.circular(14), bottomLeft: Radius.circular(14))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(11), bottomRight: Radius.circular(11)),
                    ),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        _renderItemInfo(AppLocalizations.current.orderCode, value.dhsxkdCustomerInfo.maGd),
                        const SizedBox(
                          height: 8,
                        ),
                        _renderItemInfo(
                            AppLocalizations.current.orderDate, DatetimeFormat().formatDate(value.createdDate)),
                        const SizedBox(
                          height: 8,
                        ),
                        _renderItemInfo(AppLocalizations.current.status, value.getStateText(),
                            contentFontWeight: FontWeight.w600, contentColor: getStatusColor(value)),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 6),
                          color: Colors.white,
                          height: 14,
                          alignment: Alignment.center,
                          child: Assets.images.icLine.image(fit: BoxFit.fitWidth),
                        ),
                        InkWell(
                          onTap: () {
                            // if (value.getTypeEnum() != OrderType.newCert) {
                            //   return;
                            // }
                            // controller.currentOrderCertModel.value = value;
                            Get.to(() => OrderDetailScreen(
                                  orderCertModel: value,
                                  // isCompleted: widget.listPageStatus == _ListPageStatus.done,
                                ))?.then((value) {
                              // appRefreshController?.refresh(params: getParam(), isRefresh: false);
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.eyeOrderDetail.image(width: 16, height: 16, fit: BoxFit.contain),
                              const SizedBox(
                                width: 4,
                              ),
                              BaseText(
                                AppLocalizations.current.viewOrderDetail,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                // height: 24 / 14,
                                textAlign: TextAlign.center,
                                color: const Color(0xff39476A),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
      headerBuilder: (int? value) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
          child: Row(
            children: [
              BaseText(
                AppLocalizations.current.quantity,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 24 / 16,
                color: const Color(0xff08285C),
              ),
              const SizedBox(
                width: 5,
              ),
              BaseText(
                "(${value ?? 0})",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
                color: const Color(0xff44507B),
              )
            ],
          ),
        );
      },
      params: getParam(),
      // getListData: (listData) {
      //   listCert = listData;
      // },
      // appRefreshController: appRefreshController,
      isShowViewMore: false,
      emptyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.icCertPackEmpty.image(width: 157, height: 135, fit: BoxFit.cover),
            SizedBox(
              height: 10,
            ),
            BaseText(
              AppLocalizations.current.emptyOrderData,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 24 / 14,
              color: Color(0xff5768A5),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      isLoadMore: true,
      itemSpace: 20,
      listPadding: const EdgeInsets.only(bottom: 16),
      wrapMargin: const EdgeInsets.only(top: 10),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _HeaderOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function onTap;

  const _HeaderOption({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xffE7F1FB) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? const Color(0xff0D75D6) : const Color(0xffC9CED7))),
        child: BaseText(
          label,
          color: isSelected ? const Color(0xff0D75D6) : const Color(0xff5768A5),
        ),
      ),
    );
  }
}

class _Note extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoteState();
  }
}

class _NoteState extends State<_Note> {
  bool isExpand = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpand = !isExpand;
              });
            },
            child: Row(children: [
              Assets.images.icCertInfo.image(width: 20, height: 20, fit: BoxFit.fill),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: BaseText(
                  AppLocalizations.current.whatYouNeedTKnow,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  // height: 24 / 14,
                  color: const Color(0xff5768A5),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              isExpand
                  ? Assets.images.icArrowUp.image(width: 20, height: 20, fit: BoxFit.fill)
                  : Assets.images.icArrowDown.image(width: 20, height: 20, fit: BoxFit.fill),
            ]),
          ),
          Visibility(
              visible: isExpand,
              child: Column(
                children: [
                  Row(
                    children: [
                      Assets.images.icCertInfo
                          .image(width: 20, height: 20, fit: BoxFit.fill, color: Colors.transparent),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: BaseText(
                          AppLocalizations.current.orderNoteContent,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 24 / 14,
                          color: const Color(0xff5768A5),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                  _BulletText(AppLocalizations.current.orderNoteContentState1),
                  _BulletText(AppLocalizations.current.orderNoteContentState2),
                  _BulletText(AppLocalizations.current.orderNoteContentState3),
                  _BulletText(AppLocalizations.current.orderNoteContentState4),
                ],
              )),
        ],
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String content;
  final bool bulletVisible;
  final bool contentBold;

  const _BulletText(this.content, {this.bulletVisible = true, this.contentBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 30,
        ),
        BaseText(
          AppLocalizations.current.bulletDot,
          fontWeight: FontWeight.w700,
          color: bulletVisible ? const Color(0xff5768A5) : Colors.transparent,
          fontSize: 14,
          height: 24 / 14,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: BaseText(
            content,
            fontWeight: contentBold ? FontWeight.w700 : FontWeight.w400,
            color: const Color(0xff5768A5),
            fontSize: 14,
            height: 24 / 14,
          ),
        )
      ],
    );
  }
}

class _FilterBoxWidget extends StatefulWidget {
  final int? currentType;
  final String? fromDate;
  final String? toDate;

  final List<String> orderTypes;
  final Function? getFilter;

  const _FilterBoxWidget(
      {super.key, this.currentType, this.fromDate, this.toDate, required this.orderTypes, this.getFilter});

  @override
  State<StatefulWidget> createState() {
    return _FilterBoxState();
  }
}

class _FilterBoxState extends State<_FilterBoxWidget> {
  int? _currentType;
  String? _fromDate;
  String? _toDate;

  String _error = "";

  late TextEditingController startDateController;
  late TextEditingController endDateController;

  @override
  void initState() {
    _currentType = widget.currentType ?? 0;
    _fromDate = widget.fromDate;
    _toDate = widget.toDate;

    startDateController = TextEditingController(text: _fromDate ?? "");
    endDateController = TextEditingController(text: _toDate ?? "");
    // _toDate = "abc";
    // debugPrint("$_toDate - ${widget.toDate}");

    super.initState();
  }

  Widget renderBaseTextInput({required String title, required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: BaseText(
              title,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xff08285C),
            ),
          ),
          child
        ],
      ),
    );
  }

  _checkError() {
    if (_fromDate != null && _toDate == null) {
      setState(() {
        _error = AppLocalizations.current.pleaseChooseEndDate;
      });
      return;
    }
    if (_fromDate == null && _toDate != null) {
      setState(() {
        _error = AppLocalizations.current.pleaseChooseStartDate;
      });
      return;
    }
    if (_fromDate != null && _toDate != null) {
      DateTime? from = DatetimeFormat().parseStringToDate(_fromDate!);
      DateTime? to = DatetimeFormat().parseStringToDate(_toDate!);
      if (from != null && to != null && to.isBefore(from)) {
        setState(() {
          _error = AppLocalizations.current.pleaseChooseDateValid;
        });
        return;
      }
    }
    setState(() {
      _error = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffE0E0E0)))),
            child: Row(
              children: [
                Expanded(
                  child: BaseText(
                    AppLocalizations.current.searchFilters,
                    color: const Color(0xff08285C),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 26,
                    height: 26,
                    alignment: Alignment.center,
                    child: Assets.images.icQrClose
                        .image(width: 20, height: 20, color: const Color(0xff6D6D6D), fit: BoxFit.fill),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  AppLocalizations.current.requestOrderType,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff08285C),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 9),
            child: CustomDropDown(
              selectedIndex: _currentType,
              didSelected: (index) async {
                _currentType = index;
              },
              listValues: widget.orderTypes,
            ),
          ),
          // _renderList(_listFilterByLuotKy),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 9),
            child: Row(
              children: [
                Expanded(
                  child: renderBaseTextInput(
                    title: AppLocalizations.of(context).fromDate,
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DatetimeFormat().parseStringToDate(_fromDate ?? "") ?? DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime.now()).then((value) {
                              startDateController.text = value?.fromDate() ?? "";
                              _fromDate = value?.fromDate();
                              _checkError();
                        });
                      },
                      child: TextField(
                        enabled: false,
                        controller: startDateController,
                        textInputAction: TextInputAction.done,
                        decoration: ConfigInputDecoration().config(AppLocalizations.of(context).selectDate,
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Assets.images.icCalendar.image(width: 20, height: 20, fit: BoxFit.contain),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: renderBaseTextInput(
                    title: AppLocalizations.of(context).toDate,
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DatetimeFormat().parseStringToDate(_toDate ?? "") ?? DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime.now()).then((value) {
                          endDateController.text = value?.fromDate() ?? "";
                          _toDate = value?.fromDate();
                          _checkError();
                        });

                        // CustomBottomSheetDialog.showDatePicker(context,
                        //     lastDate: DateTime.now(),
                        //     initialDate: DateTime.now())
                        //     .then((value) {
                        //   if (value != null) {
                        //     // historyRequestModel.toDate = value;
                        //     // endDateController.text =
                        //     //     historyRequestModel.toDate?.fromDate() ??
                        //     //         "";
                        //   }
                        // });
                      },
                      child: TextField(
                        enabled: false,
                        controller: endDateController,
                        textInputAction: TextInputAction.done,
                        decoration: ConfigInputDecoration().config(AppLocalizations.of(context).selectDate,
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Assets.images.icCalendar.image(width: 20, height: 20, fit: BoxFit.contain),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _error.isNotEmpty,
            child: BaseText(
              _error,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ),
          // _renderList(_listFilterByMonth1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: AppButtonWidget(
              label: AppLocalizations.current.apply,
              onTap: () {
                // todo
                debugPrint("F $_fromDate - T $_toDate");
                if (_fromDate != null && _toDate == null) {
                  setState(() {
                    _error = AppLocalizations.current.pleaseChooseEndDate;
                  });
                  return;
                }
                if (_fromDate == null && _toDate != null) {
                  setState(() {
                    _error = AppLocalizations.current.pleaseChooseStartDate;
                  });
                  return;
                }
                if (_fromDate != null && _toDate != null) {
                  DateTime? from = DatetimeFormat().parseStringToDate(_fromDate!);
                  DateTime? to = DatetimeFormat().parseStringToDate(_toDate!);
                  if (from != null && to != null && to.isBefore(from)) {
                    setState(() {
                      _error = AppLocalizations.current.pleaseChooseDateValid;
                    });
                    return;
                  }
                }
                Navigator.pop(context);
                widget.getFilter?.call(_currentType, _fromDate, _toDate);
              },
            ),
          ),
        ],
      ),
    );
  }
}
