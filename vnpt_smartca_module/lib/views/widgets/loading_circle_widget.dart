import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import '../../../gen/assets.gen.dart';
import '../../../views/widgets/widget.dart';

class LoadingCircleWidget extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final double? sizeLoading;

  const LoadingCircleWidget({Key? key, this.title, this.sizeLoading, this.subtitle})
      : super(key: key);

  @override
  State<LoadingCircleWidget> createState() => _LoadingCircleWidgetState();
}

class _LoadingCircleWidgetState extends State<LoadingCircleWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child:
              Assets.images.icLoading.image(width: widget.sizeLoading ?? 100),
        ),
        if (widget.title?.isNotEmpty ?? false)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: BaseText(
              widget.title,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              height: 24 / 16,
              color: const Color(0xff08285C),
            ),
          ),
        if (widget.subtitle?.isNotEmpty ?? false)
          Container(
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: BaseText(
              widget.subtitle,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              height: 24 / 14,
              color: const Color(0xff5768A5),
            ),
          ),
      ],
    );
  }
}
