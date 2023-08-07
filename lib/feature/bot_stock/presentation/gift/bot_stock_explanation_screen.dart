import 'package:flutter/material.dart';

import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../core/presentation/buttons/secondary/extra_info_button.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/feature_flags.dart';
import '../../../../generated/l10n.dart';
import '../../../tabs/presentation/tab_screen.dart';
import '../../../tabs/utils/tab_util.dart';
import '../widgets/bot_stock_form.dart';
import '../widgets/circular_bot_card.dart';
import 'bot_stock_do_screen.dart';

class BotStockExplanationScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_explanation_screen';

  const BotStockExplanationScreen({Key? key}) : super(key: key);

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
            S.of(context).botStockExplanationScreenTitle,
            style: AskLoraTextStyles.h4,
          ),
          const SizedBox(height: 100),
          const WhatIsBotTutorial(),
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: PrimaryButton(
          label: S.of(context).botStockExplanationScreenBottomButton,
          onTap: () {
            if (FeatureFlags.isMockApp) {
              TabScreen.openAndRemoveAllRoute(context,
                  initialTabPage: TabPage.forYou);
            } else {
              BotStockDoScreen.open(context);
            }
          },
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}

class WhatIsBotTutorial extends StatefulWidget {
  const WhatIsBotTutorial({super.key});

  @override
  State<WhatIsBotTutorial> createState() => _WhatIsBotTutorialState();
}

class _WhatIsBotTutorialState extends State<WhatIsBotTutorial>
    with SingleTickerProviderStateMixin {
  bool move = false;
  bool show = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => setState(() {
              move = true;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: move ? 0.3 : 1.0,
          duration: const Duration(milliseconds: 1500),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: move ? Alignment.center : Alignment.centerLeft,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastOutSlowIn,
                child: const CircularBotCard(
                    title: 'SQUAT',
                    backgroundColor: AskLoraColors.purple,
                    subTitleBackgroundColor: AskLoraColors.darkerPurple,
                    subTitle: 'AI BOT'),
              ),
              AnimatedAlign(
                alignment: move ? Alignment.center : Alignment.centerRight,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastOutSlowIn,
                child: const CircularBotCard(
                    title: 'TSLA',
                    backgroundColor: AskLoraColors.lightGray50Alpha,
                    subTitleBackgroundColor: AskLoraColors.darkGray,
                    subTitle: 'STOCK'),
                onEnd: () {
                  setState(() {
                    show = true;
                  });
                },
              ),
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: const Align(
            alignment: Alignment.center,
            child: CircularBotCard(
                title: 'SQUAT TSLA',
                backgroundColor: AskLoraColors.purple,
                subTitleBackgroundColor: AskLoraColors.darkerPurple50Alpha,
                subTitle: 'BOTSTOCK'),
          ),
        ),
      ],
    );
  }
}
