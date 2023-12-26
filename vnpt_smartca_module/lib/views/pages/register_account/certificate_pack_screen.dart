import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/models/app/purchase_cert_order_item_model.dart';
import '../../../core/models/app/purchase_certificate_model.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/buy_certificate_controller.dart';
import '../../controller/enter_info_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../utils/config_input_decoration.dart';
import '../../widgets/widget.dart';

class CertificatePackScreen extends StatefulWidget {
  final CardInfo cardInfo;
  final List<CertificateModel> listCerts;

  const CertificatePackScreen({super.key, required this.cardInfo, required this.listCerts});

  @override
  State<StatefulWidget> createState() {
    return _CertificatePackBody();
  }
}

class _CertificatePackBody extends State<CertificatePackScreen> {
  // mua chung thu so
  final controller = Get.put(EnterInfoController());
  final buyCertController = Get.put(BuyCertificateController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      controller.fetchItems();
      buyCertController.ekycErrorCount = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.selectCertificatePack,
      loadingWidget: const Stack(
        children: [BaseLoading<EnterInfoController>(), BaseLoading<BuyCertificateController>()],
      ),
      colorBg: const Color.fromRGBO(241, 244, 250, 1),
      body: SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: true,
          enablePullUp: false,
          onRefresh: () {
            controller.fetchItems(isRefresh: true);
          },
          header: const WaterDropMaterialHeader(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _CertPackageFilter(),
                const SizedBox(height: 8),
                Obx(() {
                  return Container(
                    padding: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                      AppLocalizations.current.listPacks(controller.listCertPacks.value.length),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff08285C),
                    ),
                  );
                }),
                Obx(() {
                  if (controller.listCertPacks.value.isEmpty) {
                    return Column(
                      children: [
                        const SizedBox(height: 90),
                        Assets.images.icCertPackEmpty.image(width: 157, height: 135, fit: BoxFit.cover),
                        const SizedBox(height: 20),
                        BaseText(
                          AppLocalizations.current.emptyDataFiltered,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff5768A5),
                          height: 24 / 14,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }

                  return Column(
                    children: controller.listCertPacks.value
                        .map((e) => InkWell(
                            onTap: () {
                              buyCertController.createOrder(e.pricingCode?.toString());
                            },
                            child: _CertPackageViewWidget(purchaseCertificateModel: e)))
                        .toList(),
                  );
                }),
                const SizedBox(height: 16),
              ],
            ),
          )),
    );
  }
}

class _CertPackageViewWidget extends StatelessWidget {
  final PurchaseCertificateModel purchaseCertificateModel;

  const _CertPackageViewWidget({required this.purchaseCertificateModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 9, left: 9),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
            ),
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: BaseText(
              purchaseCertificateModel.pricingName,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color(0xff0D75D6),
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
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(14), bottomRight: Radius.circular(14))),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  color: Colors.white,
                  height: 14,
                  alignment: Alignment.center,
                  child: Assets.images.icLine.image(fit: BoxFit.fitWidth),
                ),
              ),
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11), bottomRight: Radius.circular(11)),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.usedTime,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff5768A5),
                    ),
                    BaseText(
                      purchaseCertificateModel.timeValidityStr,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff08285C),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.serviceCharge,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff5768A5),
                    ),
                    BaseText(
                      purchaseCertificateModel.priceStr,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff0D75D6),
                    )
                  ],
                ),
                const SizedBox(height: 13),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CertPackageFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CertPackageFilterBody();
  }
}

class _CertPackageFilterBody extends State<_CertPackageFilter> {
  final controller = Get.find<EnterInfoController>();
  GlobalKey<FormBuilderState> formKey3 = GlobalKey<FormBuilderState>();

  final List<CertPackFilterModel> _filterModels = [];

  List<CertPackFilterModel> _listHasFilter = [];

  @override
  void initState() {
    // all
    _filterModels.add(CertPackFilterModel(-1, AppLocalizations.current.all, true));
    // theo luot ky
    _filterModels.add(CertPackFilterModel(1, AppLocalizations.current.bySignatures, false));
    // khong gioi han luot ky
    _filterModels.add(CertPackFilterModel(0, AppLocalizations.current.unlimitedNumberOfSignatures, false));

    // controller.fetchItems();

    super.initState();
  }

  _renderDieuBanCanBiet() {
    bool canShow = false;
    if (_listHasFilter.isNotEmpty) {
      canShow = _listHasFilter.any((element) => element.code == 1 && element.isSelected == true);
    } else {
      canShow = _filterModels.any((element) => element.code == 1 && element.isSelected == true);
    }
    return canShow
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Assets.images.icCertInfo.image(width: 20, height: 20, fit: BoxFit.fill),
                    const SizedBox(
                      width: 6,
                    ),
                    BaseText(
                      AppLocalizations.current.whatYouNeedTKnow,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff5768A5),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.circle,
                        size: 7,
                        color: Color(0xff5768A5),
                      ),
                    ),
                    Expanded(
                        child: BaseText(
                      AppLocalizations.current.youKnowOne,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      color: const Color(0xff5768A5),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.circle,
                        size: 7,
                        color: Color(0xff5768A5),
                      ),
                    ),
                    Expanded(
                        child: BaseText(
                      AppLocalizations.current.youKnowTwo,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      color: const Color(0xff5768A5),
                    )),
                  ],
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  _renderList(List<CertPackFilterModel> listFilter, bool hasClearButton) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              if (hasClearButton) {
                // nothing to do
              } else {
                for (var element in _filterModels) {
                  element.isSelected = false;
                }
                _filterModels[index].isSelected = true;
                setState(() {
                  if (index > 0) {
                    controller.filter([_filterModels[index]]);
                  } else {
                    controller.filter([_filterModels[1], _filterModels[2]]);
                  }
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: listFilter[index].isSelected ? const Color(0xffE7F1FB) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: listFilter[index].isSelected ? const Color(0xff0D75D6) : const Color(0xffC9CED7))),
              child: hasClearButton
                  ? Row(
                      children: [
                        BaseText(
                          listFilter[index].name,
                          color: listFilter[index].isSelected ? const Color(0xff0D75D6) : const Color(0xff5768A5),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {
                            _listHasFilter.removeAt(index);

                            if (_listHasFilter.isEmpty) {
                              setState(() {
                                controller
                                    .filter(_filterModels.where((element) => element.isSelected == true).toList());
                              });
                            } else {
                              setState(() {
                                controller.filter(_listHasFilter);
                              });
                            }
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
                    )
                  : BaseText(
                      listFilter[index].name,
                      color: listFilter[index].isSelected ? const Color(0xff0D75D6) : const Color(0xff5768A5),
                    ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemCount: listFilter.length,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: controller.formKey3,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 12),
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
                        if (value != null) {
                          controller.filterByString(value.toLowerCase().trim());
                        }
                      },
                      maxLength: 250,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.maxLength(250, errorText: AppLocalizations.current.maxLength(250)),
                      ]),
                      decoration: ConfigInputDecoration().config(AppLocalizations.current.enterThePackageNameToSearch,
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
                                    listSelected: _listHasFilter,
                                    getNewListSelected: (List<CertPackFilterModel> listSelected) {
                                      _listHasFilter = listSelected;
                                      setState(() {
                                        controller.filter(_listHasFilter);
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
        _listHasFilter.isNotEmpty ? _renderList(_listHasFilter, true) : _renderList(_filterModels, false),
        const SizedBox(
          height: 12,
        ),
        _renderDieuBanCanBiet(),
      ],
    );
  }
}

class _FilterBoxWidget extends StatefulWidget {
  final List<CertPackFilterModel> listSelected;
  final Function(List<CertPackFilterModel>)? getNewListSelected;

  const _FilterBoxWidget({super.key, required this.listSelected, this.getNewListSelected});

  @override
  State<StatefulWidget> createState() {
    return _FilterBoxState();
  }
}

class _FilterBoxState extends State<_FilterBoxWidget> {
  final List<CertPackFilterModel> _listFilterByLuotKy = [];
  final List<CertPackFilterModel> _listFilterByMonth1 = [];
  final List<CertPackFilterModel> _listFilterByMonth2 = [];

  bool _checkSelected(int code) {
    return widget.listSelected.any((element) => element.code == code);
  }

  @override
  void initState() {
    // all
    // _listFilterByLuotKy.add(_FilterModel("", AppLocalizations.current.all, true));
    // theo luot ky
    _listFilterByLuotKy.add(CertPackFilterModel(1, AppLocalizations.current.bySignatures, _checkSelected(1)));
    // khong gioi han luot ky
    _listFilterByLuotKy
        .add(CertPackFilterModel(0, AppLocalizations.current.unlimitedNumberOfSignatures, _checkSelected(0)));

    // filter theo thang
    _listFilterByMonth1
        .add(CertPackFilterModel(2, AppLocalizations.current.filterByMonth(1), _checkSelected(2), month: 1));
    _listFilterByMonth1
        .add(CertPackFilterModel(3, AppLocalizations.current.filterByMonth(3), _checkSelected(3), month: 3));
    _listFilterByMonth1
        .add(CertPackFilterModel(4, AppLocalizations.current.filterByMonth(6), _checkSelected(4), month: 6));

    _listFilterByMonth2
        .add(CertPackFilterModel(5, AppLocalizations.current.filterByMonth(12), _checkSelected(5), month: 12));
    _listFilterByMonth2
        .add(CertPackFilterModel(6, AppLocalizations.current.filterByMonth(24), _checkSelected(6), month: 24));
    _listFilterByMonth2
        .add(CertPackFilterModel(7, AppLocalizations.current.filterByMonth(36), _checkSelected(7), month: 36));
    super.initState();
  }

  _renderList(List<CertPackFilterModel> listFilter) {
    List<Widget> widgets = [];
    for (CertPackFilterModel e in listFilter) {
      if (listFilter.indexOf(e) != 0) {
        widgets.add(const SizedBox(
          width: 16,
        ));
      }
      widgets.add(Expanded(
        flex: listFilter.length == 2 ? (listFilter.indexOf(e) == 0 ? 4 : 6) : 1,
        child: InkWell(
          onTap: () {
            e.isSelected = !e.isSelected;
            setState(() {});
          },
          child: Container(
            // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: e.isSelected ? const Color(0xffE7F1FB) : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: e.isSelected ? const Color(0xff0D75D6) : const Color(0xffC9CED7))),
            child: BaseText(
              e.name,
              color: e.isSelected ? const Color(0xff0D75D6) : const Color(0xff5768A5),
            ),
          ),
        ),
      ));
    }

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgets,
      ),
    );

    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              listFilter[index].isSelected = !listFilter[index].isSelected;
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: listFilter[index].isSelected ? const Color(0xffE7F1FB) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: listFilter[index].isSelected ? const Color(0xff0D75D6) : const Color(0xffC9CED7))),
              child: BaseText(
                listFilter[index].name,
                color: listFilter[index].isSelected ? const Color(0xff0D75D6) : const Color(0xff5768A5),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemCount: listFilter.length,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
    );
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
                  AppLocalizations.current.bySignatures,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff08285C),
                ),
                InkWell(
                  onTap: () {
                    for (var element in _listFilterByLuotKy) {
                      element.isSelected = true;
                    }
                    setState(() {});
                  },
                  child: BaseText(
                    AppLocalizations.current.selectAll,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff0D75D6),
                  ),
                ),
              ],
            ),
          ),
          _renderList(_listFilterByLuotKy),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  AppLocalizations.current.cycle,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff08285C),
                ),
                InkWell(
                  onTap: () {
                    for (var element in _listFilterByMonth1) {
                      element.isSelected = true;
                    }
                    for (var element in _listFilterByMonth2) {
                      element.isSelected = true;
                    }
                    setState(() {});
                  },
                  child: BaseText(
                    AppLocalizations.current.selectAll,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff0D75D6),
                  ),
                ),
              ],
            ),
          ),
          _renderList(_listFilterByMonth1),
          const SizedBox(
            height: 12,
          ),
          _renderList(_listFilterByMonth2),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: AppButtonWidget(
              label: AppLocalizations.current.apply,
              onTap: () {
                if (widget.getNewListSelected != null) {
                  List<CertPackFilterModel> listSelected = [];
                  for (var element in _listFilterByLuotKy) {
                    if (element.isSelected == true) {
                      listSelected.add(element);
                    }
                  }
                  for (var element in _listFilterByMonth1) {
                    if (element.isSelected == true) {
                      listSelected.add(element);
                    }
                  }
                  for (var element in _listFilterByMonth2) {
                    if (element.isSelected == true) {
                      listSelected.add(element);
                    }
                  }
                  widget.getNewListSelected?.call(listSelected);
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
