import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../i18n/generated_locales/l10n.dart';

import '../../../widgets/widget.dart';
import '../../active_account/bottom_contact.dart';

class SignTicketExtendError extends StatelessWidget {
  const SignTicketExtendError({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.sign_ticket_extension_title,
      // hiddenIconBack: true,
      body: Column(
        children: [
          // SizedBox(height: 16,),
          // const ImageSliderWidget(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.icSignDocError.image(width: 150, fit: BoxFit.fitWidth),
                  const SizedBox(height: 20),
                  BaseText(
                    AppLocalizations.current.create_ticket_extension_error_label,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xff08285C),
                  ),
                  const SizedBox(height: 10),
                  BaseText(
                    AppLocalizations.current.create_ticket_extension_error_description,
                    color: const Color(0xff5768A5),
                    textAlign: TextAlign.center,
                    height: 24 / 14,
                  ),
                ],
              ),
            ),
          ),
          const BottomContact(),
        ],
      ),
    );
  }

}