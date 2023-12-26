// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../widgets/base_text.dart';

import '../../gen/assets.gen.dart';

class CustomDropDown extends StatefulWidget {
  final double? heightOfBox;
  final EdgeInsets margin;
  final String title;
  final String hintText;
  final List<String> listValues;
  final int? selectedIndex;
  final Function? didSelected;
  final bool isRequired;

  CustomDropDown(
      {this.heightOfBox,
      this.margin = EdgeInsets.zero,
      this.title = "",
      this.hintText = "",
      required this.listValues,
      this.selectedIndex,
      this.didSelected,
      this.isRequired = false});

  @override
  State<StatefulWidget> createState() {
    return _CustomDropDownState();
  }
}

class _CustomDropDownState extends State<CustomDropDown> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null &&
        widget.selectedIndex! < widget.listValues.length) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  void didUpdateWidget(covariant CustomDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != null &&
        widget.selectedIndex! < widget.listValues.length &&
        widget.selectedIndex! >= 0) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: widget.margin,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if (widget.title.isNotEmpty)
          //   Container(
          //     child: CustomTextLabel(
          //       widget.title,
          //       color: AppColors.ff828282,
          //       fontSize: 14.sw,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          Container(
            // height: widget.heightOfBox ?? 48.sw,
            // padding: EdgeInsets.only(right: 15.sw),
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 45,
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: Color(0xffCBCFD7),
              //   width: 1,
              // ),
              borderRadius: BorderRadius.circular(7),
              color: Color(0xffF2F6FA),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                items: createListDropdownMenuItem(),
                value: selectedIndex,
                onChanged: (int? index) {
                  setState(() {
                    selectedIndex = index;
                    widget.didSelected?.call(index);
                  });
                },
                // style: TextStyle(color: Color(0xff202223), fontSize: 14, fontWeight: FontWeight.w400),
                // hint: BaseText(
                //   widget.hintText,
                //   color: Color(0xff31394D),
                //   fontSize: 16,
                // ),
                icon: Assets.images.arrowDown.image(
                  width: 10,
                  height: 7,
                  fit: BoxFit.contain,
                ),
                // icon: null,
                // iconSize: 0,
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> createListDropdownMenuItem() {
    List<DropdownMenuItem<int>> list = [];
    for (int i = 0; i < widget.listValues.length; i++) {
      DropdownMenuItem<int> item = DropdownMenuItem<int>(
        value: i,
        child: BaseText(
          widget.listValues[i],
          maxLines: 1,
          fontSize: 16,
        ),
      );
      list.add(item);
    }
    return list;
  }
}
