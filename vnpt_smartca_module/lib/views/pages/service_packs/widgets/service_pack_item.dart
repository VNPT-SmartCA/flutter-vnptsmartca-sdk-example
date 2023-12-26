import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/response/service_pack_model.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/color.dart';

class ServicePackItem extends StatefulWidget {
  final ServicePackModel? servicePackModel;
  final Function addToCart;
  final Function removeToCart;

  const ServicePackItem(
      {Key? key,
      this.servicePackModel,
      required this.addToCart,
      required this.removeToCart})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ServicePackItemState createState() => _ServicePackItemState();
}

class _ServicePackItemState extends State<ServicePackItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
              Text(widget.servicePackModel!.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: HexColor("#121D3F"))),
              Text(
                NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                    .format(widget.servicePackModel!.price),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: HexColor("#121D3F")),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${widget.servicePackModel!.signTurnNumber.toString().padLeft(2, "0")} ${AppLocalizations.of(context).service_pack_signatures}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: HexColor("#5E6476"))),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildOutlineButton(
                      icon: Icons.remove,
                      press: widget.removeToCart,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0 / 2),
                      child: Text(
                        // if our item is less  then 10 then  it shows 01 02 like that
                        widget.servicePackModel!.quantity
                            .toString()
                            .padLeft(2, "0"),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    buildOutlineButton(
                        icon: Icons.add, press: widget.addToCart)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // ignore: avoid-unused-parameters
  SizedBox buildOutlineButton({IconData? icon, dynamic press}) {
    return SizedBox(
      width: 24,
      height: 24,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(
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
