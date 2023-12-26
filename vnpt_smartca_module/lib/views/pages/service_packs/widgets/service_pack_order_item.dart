import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/models/response/service_pack_model.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/color.dart';

class ServicePackOrderItem extends StatefulWidget {
  final ServicePackModel? product;
  final Function addToCart;
  final Function removeToCart;
  final Function removeOrder;

  const ServicePackOrderItem(
      {Key? key,
      this.product,
      required this.addToCart,
      required this.removeToCart,
      required this.removeOrder})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ServicePackOrderItemState createState() => _ServicePackOrderItemState();
}

class _ServicePackOrderItemState extends State<ServicePackOrderItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, blurRadius: 20, spreadRadius: 1)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => {widget.removeOrder()},
                child: SvgPicture.asset(
                  "assets/svg/close_popup.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
                style: const ButtonStyle(alignment: Alignment.topRight),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(.0),
                child: SvgPicture.asset(
                  "assets/svg/tengoi.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Expanded(
                  child: Text(
                AppLocalizations.of(context).product_name,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              )),
              Text(
                  '${widget.product!.name} - ${widget.product!.signTurnNumber} Lượt ký',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#121D3F"))),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(.0),
                child: SvgPicture.asset(
                  "assets/svg/soluong.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Expanded(
                  child: Text(
                AppLocalizations.of(context).product_quantity,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              )),
              Spacer(),
              buildOutlineButton(
                  icon: Icons.remove, press: widget.removeToCart),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 / 2),
                child: Text(
                  // if our item is less  then 10 then  it shows 01 02 like that
                  // ignore: unnecessary_string_interpolations
                  "${widget.product!.quantity.toString().padLeft(2, "0")}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#121D3F")),
                ),
              ),
              buildOutlineButton(icon: Icons.add, press: widget.addToCart),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(.0),
                child: SvgPicture.asset(
                  "assets/svg/dongia.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Expanded(
                  child: Text(
                AppLocalizations.of(context).product_price,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              )),
              Text(
                  NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                      .format(widget.product!.price),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#121D3F"))),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(.0),
                child: SvgPicture.asset(
                  "assets/svg/thanhtien.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Expanded(
                  child: Text(
                AppLocalizations.of(context).product_money,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              )),
              Text(
                  NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                      .format(widget.product!.price * widget.product!.quantity),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#121D3F"))),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildOutlineButton({IconData? icon, dynamic press}) {
    return SizedBox(
      width: 24,
      height: 24,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: .0,
              color: Colors.white,
              style: BorderStyle.none,
            ),
            backgroundColor: HexColor("#E7EFF6"),
            padding: const EdgeInsets.all(0)),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
