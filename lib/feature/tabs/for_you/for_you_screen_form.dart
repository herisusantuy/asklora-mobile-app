import 'package:flutter/material.dart';

import '../../../core/presentation/bot_stock_background_with_pop_up.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';

class ForYouScreenForm extends StatelessWidget {
  const ForYouScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      backgroundColor: AskLoraColors.white,
      body: BotStockBackgroundWithPopUp(
          header: CustomTextNew(
            'Investments for you, by you',
            style: AskLoraTextStyles.h2.copyWith(color: AskLoraColors.charcoal),
          ),
          popUpTitle: 'No Botstock recommendation.',
          popUpSubTitle:
              'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
          popUpButtonLabel: 'CREATE AN ACCOUNT',
          onPopUpButtonTap: () {}),
    );
  }
}
