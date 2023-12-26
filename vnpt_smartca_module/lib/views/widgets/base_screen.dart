import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../gen/assets.gen.dart';
import '../../../views/theme/styles.dart';
import '../../../views/widgets/widget.dart';
import '../../configs/injector/injector.dart';
import '../../method_channel_handler.dart';
import 'navigator_helper.dart';

class BaseScreen extends StatelessWidget {
  static const double toolbarHeight = 56;

  // body của màn hình
  final Widget? body;

  // title của appbar có 2 kiểu String và Widget
  // title là kiểu Widget thì sẽ render widget
  // title là String
  final dynamic? title;

  // trường hợp có AppBar đặc biệt thì dùng customAppBar
  final Widget? customAppBar;

  final Color appBarColor;
  final Color? appBarBoxShadowColor;

  // callBack của onBackPress với trường hợp  hiddenIconBack = false
  final Function? onBackPress;

  // custom widget bên phải của appBar
  final List<Widget>? rightWidgets;

  // loadingWidget để show loading toàn màn hình
  final Widget? loadingWidget;

  final Widget? floatingButton;

  // nếu true => sẽ ẩn backIcon , mặc định là true
  final bool hiddenIconBack;

  final Color colorTitle;
  final bool hideAppBar;

  // base bg color
  final Color colorBg;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  const BaseScreen({
    Key? key,
    this.body,
    this.title = "",
    this.customAppBar,
    this.onBackPress,
    this.rightWidgets,
    this.hiddenIconBack = false,
    this.colorTitle = const Color(0xff08285C),
    this.loadingWidget,
    this.hideAppBar = false,
    this.floatingButton,
    this.colorBg = AppColors.white,
    this.appBarColor = Colors.white,
    this.appBarBoxShadowColor,
    this.systemUiOverlayStyle = SystemUiOverlayStyle.dark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Stack(
        children: [
          Scaffold(
              appBar: hideAppBar ? null : (customAppBar ?? baseAppBar(context)),
              backgroundColor: colorBg,
              body: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: body ?? Container(),
              ),
              floatingActionButton: floatingButton),
          Positioned.fill(
            child: loadingWidget ?? Container(),
          ),
        ],
      ),
    );
  }

  baseAppBar(BuildContext context) {
    Widget widgetTitle;
    if (title is Widget) {
      widgetTitle = title;
    } else {
      widgetTitle = BaseText(
        title,
        maxLines: 2,
        color: colorTitle,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        textAlign: TextAlign.center,
      );
    }
    return PreferredSize(
      preferredSize: const Size.fromHeight(toolbarHeight),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: appBarBoxShadowColor ?? const Color(0xff1A3478).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ]),
        child: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          title: widgetTitle,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leading: hiddenIconBack
              ? Container()
              : InkWell(
                  onTap: () {
                    // Get.back();
                    Navigator.pop(context);
                    onBackPress?.call();
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    child: Assets.images.arrowLeft.image(
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          centerTitle: true,
          actions: rightWidgets,
        ),
      ),
    );
  }
}
