import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../views/controller/app_list_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/utils/color.dart';
import '../../../views/widgets/base_text.dart';

class AppRefresh<T extends AppRefreshModel> extends StatefulWidget {
  // final RefreshController refreshController;
  // url path
  final String path;
  final T Function(Map<String, dynamic>) fromMap;
  final Map<String, dynamic>? params;
  final AppRefreshController? appRefreshController;

  final Widget Function(T value, int index) itemWidgetBuilder;
  final Widget Function(int? value)? headerBuilder;
  final Function(List<T> value)? getListData;
  final bool isLoadMore;
  final EdgeInsets? wrapMargin;
  final EdgeInsets? listPadding;
  final double? itemSpace;
  final bool isShowViewMore;
  final bool Function(T value)? filter;
  final Widget? emptyWidget;

  final String? keyController;

  const AppRefresh(
      {super.key,
      required this.path,
      required this.fromMap,
      required this.itemWidgetBuilder,
      this.getListData,
      this.params,
      this.isLoadMore = false,
      this.wrapMargin,
      this.listPadding,
      this.itemSpace,
      this.appRefreshController,
      this.headerBuilder,
      this.isShowViewMore = false,
      this.keyController,
      this.filter, this.emptyWidget});

  @override
  State<StatefulWidget> createState() {
    return _AppRefreshState<T>();
  }
}

class _AppRefreshState<T extends AppRefreshModel> extends State<AppRefresh<T>> {
  late AppListController<T> controller;

  @override
  void initState() {
    controller = Get.put(AppListController<T>(), tag: widget.keyController);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getData(widget.path, widget.fromMap, bodyOrParam: widget.params);
      if (widget.appRefreshController != null) {
        widget.appRefreshController?.params = widget.params;
        widget.appRefreshController?.addListener(() {
          controller.getData(widget.path, widget.fromMap,
              bodyOrParam: widget.appRefreshController?.params ?? widget.params,
              refreshController: widget.appRefreshController?.isRefresh == true ? controller.refreshController : null);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isViewMore = widget.isShowViewMore;
    return Obx(() {
      if (controller.isLoading.value == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      List<T> data = controller.data.value;
      try {
        if (widget.filter != null) {
          data = controller.data.value.where((element) => widget.filter!(element)).toList();
        }
      } catch (e) {}
      widget.getListData?.call(data);
      return Container(
        padding: widget.wrapMargin ?? const EdgeInsets.only(top: 8),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.headerBuilder == null ? const SizedBox() : widget.headerBuilder!(controller.totalItemCount.value),
            Expanded(
                child: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              enablePullUp: widget.isLoadMore,
              onRefresh: () {
                controller.getData(widget.path, widget.fromMap,
                    refreshController: controller.refreshController,
                    bodyOrParam:
                        widget.appRefreshController == null ? widget.params : (widget.appRefreshController?.params ?? widget.params));
              },
              onLoading: () {
                controller.getMore(widget.path, widget.fromMap, controller.refreshController,
                    bodyOrParam:
                        widget.appRefreshController == null ? widget.params : (widget.appRefreshController?.params ?? widget.params));
              },
              header: const WaterDropMaterialHeader(),
              footer: ClassicFooter(
                loadingText: AppLocalizations.current.loading,
                idleText: AppLocalizations.current.idleLoading,
                canLoadingText: AppLocalizations.current.canLoading,
              ),
              child: data.isEmpty
                  ? (widget.emptyWidget ?? Center(
                child: Text(
                  AppLocalizations.of(context).emptyData,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: HexColor("#5E6476")),
                  textAlign: TextAlign.center,
                ),
              ))
                  : ListView.separated(
                      padding: widget.listPadding ?? const EdgeInsets.only(bottom: 16),
                      itemBuilder: (_, index) {
                        if (index == data.length && widget.isShowViewMore) {
                          return Container(
                            alignment: Alignment.center,
                            // color: isViewMore ? Colors.red : Colors.blue,
                            child: InkWell(
                              onTap: () {
                                controller.getData(widget.path, widget.fromMap,
                                    refreshController: controller.refreshController,
                                    bodyOrParam: widget.appRefreshController == null
                                        ? widget.params
                                        : (widget.appRefreshController?.params ?? widget.params));
                                isViewMore = !isViewMore;
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  BaseText(
                                    isViewMore ? AppLocalizations.current.viewMore : AppLocalizations.current.collapse,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: const Color(0xff0D75D6),
                                  ),
                                  Icon(
                                    isViewMore ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                                    color: const Color(0xff0D75D6),
                                    size: 18,
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          try {
                            if (widget.isShowViewMore &&
                                isViewMore &&
                                widget.appRefreshController != null &&
                                widget.appRefreshController!.listHide != null &&
                                widget.appRefreshController!.listHide!.contains(data[index].id)) {
                              return const SizedBox();
                            }
                          } catch (e) {
                            // todo
                          }
                          return widget.itemWidgetBuilder(data[index], index);
                        }
                        return widget.itemWidgetBuilder(controller.data.value[index], index);
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(
                          height: widget.itemSpace ?? 20,
                        );
                      },
                      itemCount: widget.isShowViewMore ? (data.length + 1) : data.length),
            ))
          ],
        ),
      );
    });
  }
}

class AppRefreshController extends ChangeNotifier {
  Map<String, dynamic>? params;
  String? listHide;
  bool? isRefresh;

  refresh({Map<String, dynamic>? params, bool isRefresh = false}) {
    this.params = params;
    this.isRefresh = isRefresh;
    notifyListeners();
  }
}

class AppRefreshModel {
  String id;

  AppRefreshModel(this.id);
}
