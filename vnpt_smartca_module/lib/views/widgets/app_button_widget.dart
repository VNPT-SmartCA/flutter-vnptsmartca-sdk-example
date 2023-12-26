import 'package:flutter/material.dart';
import './base_text.dart';

class AppButtonWidget extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color backgroundColor;
  final Function? onTap;
  final double doublePadding;
  final BoxBorder? border;

  const AppButtonWidget({
    super.key,
    this.label = "",
    this.labelColor = Colors.white,
    this.backgroundColor = const Color(0xff0D75D6),
    this.onTap,
    this.doublePadding = 12,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(doublePadding),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: border),
        child: BaseText(
          label,
          color: labelColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
