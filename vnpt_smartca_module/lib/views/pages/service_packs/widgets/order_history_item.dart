import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/response/personal_sign_turn_pricing_info.dart';
import '../../../../core/models/response/service_pack_order_history_item.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/color.dart';

class OrderHistoryItem extends StatefulWidget {
  final int index;
  final ServicePackOrderHistoryItem orderHistoryItem;
  final ValueChanged<String> reReInitializeOrder;
  final PersonalSignTurnPricingInfo pricings;

  const OrderHistoryItem(
      {Key? key,
      required this.index,
      required this.orderHistoryItem,
      required this.pricings,
      required this.reReInitializeOrder})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrderHistoryItemState createState() => _OrderHistoryItemState();
}

class _OrderHistoryItemState extends State<OrderHistoryItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 0, left: 16, right: 16, top: 16),
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
                '${widget.pricings.name} - ${widget.pricings.signTurnNumber} ${AppLocalizations.of(context).service_pack_signatures}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: .0),
                child: Text(
                  // if our item is less  then 10 then  it shows 01 02 like that
                  // ignore: unnecessary_string_interpolations
                  "${widget.pricings.quantity.toString().padLeft(2, "0")}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#121D3F")),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
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
                      .format(widget.pricings.price),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#121D3F"))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
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
                      .format(widget.pricings.price * widget.pricings.quantity),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#121D3F"))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(.0),
                child: SvgPicture.asset(
                  "assets/svg/tongluotky.svg",
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
                AppLocalizations.of(context).service_pack_total_signature,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              )),
              Text(
                // ignore: unnecessary_string_interpolations
                '${(widget.orderHistoryItem.pricings!.quantity * widget.orderHistoryItem.pricings!.signTurnNumber).toString().padLeft(2, "0")}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(.0),
                child: SvgPicture.asset(
                  "assets/svg/trangthai.svg",
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
                AppLocalizations.of(context).service_pack_order_status,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#121D3F")),
              )),
              // ignore: unnecessary_string_interpolations
              Text('${widget.orderHistoryItem.textStatus}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: widget.orderHistoryItem.colorStatus)),
              (widget.orderHistoryItem.status == 99
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(Icons.warning_outlined,
                          size: 15, color: HexColor("#CB4040")),
                    )
                  : Container())
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (widget.orderHistoryItem.status != 100
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => widget.reReInitializeOrder(
                            widget.orderHistoryItem.id.toString()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 6),
                          child: Text(
                            AppLocalizations.of(context)
                                .re_create_service_order,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: HexColor("#DE9B39"),
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: HexColor("#DE9B39"),
                        ))
                  ],
                )
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
