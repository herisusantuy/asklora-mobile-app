import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/buttons/secondary/extra_info_button.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/values/app_values.dart';
import '../../../../generated/l10n.dart';
import '../../../tabs/presentation/tab_screen.dart';
import '../../../tabs/utils/tab_util.dart';
import '../../utils/bot_stock_utils.dart';
import '../widgets/bot_stock_form.dart';

class BotStockExplanationWithAnimationScreen extends StatelessWidget {
  static const String route = 'bot_stock_explanation_with_animation_screen';
  const BotStockExplanationWithAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BotStockForm(
      useHeader: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExtraInfoButton(
            onTap: () => '',
            label: 'Lora\'s tips',
            buttonExtraInfoSize: ButtonExtraInfoSize.small,
          ),
          const SizedBox(height: 20),
          CustomTextNew(
            S.of(context).botStockExplanationWithAnimationScreenTitle,
            style: AskLoraTextStyles.h4,
          ),
          const SizedBox(height: 50),
          const BotStockWithAnimation(),
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: PrimaryButton(
            label: S.of(context).understood,
            onTap: () => TabScreen.openAndRemoveAllRoute(context,
                initialTabPage: TabPage.forYou)),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}

class BotStockWithAnimation extends StatefulWidget {
  const BotStockWithAnimation({super.key});

  @override
  State<BotStockWithAnimation> createState() => _BotStockWithAnimationState();
}

class _BotStockWithAnimationState extends State<BotStockWithAnimation> {
  bool fadeInCard1 = false;
  bool fadeInCard2 = false;
  bool fadeInCard3 = false;
  double cardSpace = 20;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => setState(() => fadeInCard1 = true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: cardSpace,
      runSpacing: cardSpace + 6,
      children: [
        AnimatedOpacity(
            opacity: fadeInCard1 ? 1.0 : 0,
            onEnd: () => _fadeInCard(fadeInCard2 = true),
            duration: const Duration(milliseconds: 600),
            child: _botCard(context, botType: BotType.pullUp)),
        AnimatedOpacity(
            opacity: fadeInCard2 ? 1.0 : 0,
            duration: const Duration(milliseconds: 600),
            onEnd: () => _fadeInCard(fadeInCard3 = true),
            child: _botCard(context, botType: BotType.plank)),
        AnimatedOpacity(
            opacity: fadeInCard3 ? 1.0 : 0,
            duration: const Duration(milliseconds: 600),
            child: _botCard(context, botType: BotType.squat)),
      ],
    );
  }

  void _fadeInCard(bool setStateCard) {
    Future.delayed(
        const Duration(milliseconds: 300), () => setState(() => setStateCard));
  }

  Widget _botCard(BuildContext context, {required BotType botType}) {
    double widthOfHalfScreen = (MediaQuery.of(context).size.width -
            AppValues.screenHorizontalPadding.left -
            AppValues.screenHorizontalPadding.right -
            cardSpace) /
        2;
    return Container(
      width: widthOfHalfScreen,
      constraints: BoxConstraints(minHeight: widthOfHalfScreen),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: botType.primaryBgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextNew(
                'AAPL',
                style: AskLoraTextStyles.h5,
              ),
              CustomTextNew('Apple, Inc', style: AskLoraTextStyles.body2),
            ],
          ),
          const SizedBox(height: 5),
          getPngIcon('apple_logo', height: widthOfHalfScreen / 3),
          const SizedBox(height: 5),
          CustomTextNew(botType.value, style: AskLoraTextStyles.h5),
        ],
      ),
    );
  }
}
