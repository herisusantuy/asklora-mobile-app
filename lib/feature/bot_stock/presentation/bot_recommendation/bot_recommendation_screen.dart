import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/buttons/secondary/extra_info_button.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/presentation/lora_popup_message.dart';
import '../../../../core/presentation/shimmer.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../bloc/bot_stock_bloc.dart';
import '../../repository/bot_stock_repository.dart';
import '../../utils/bot_stock_utils.dart';
import '../widgets/custom_expansion_panel.dart';
import 'detail/bot_recommendation_detail_screen.dart';

part 'widgets/bot_learn_more_bottom_sheet.dart';

part 'widgets/bot_recommendation_card.dart';

part 'widgets/bot_recommendation_card_shimmer.dart';

part 'widgets/bot_recommendation_faq.dart';

part 'widgets/bot_recommendation_list.dart';

class BotRecommendationScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_recommendation_screen';

  const BotRecommendationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository())
        ..add(FetchBotRecommendation()),
      child: CustomScaffold(
          backgroundColor: AskLoraColors.white,
          body: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 35),
              children: [
                _header(context),
                const BotRecommendationList(
                  verticalMargin: 14,
                ),
                _loraMemojiWidget,
                const SizedBox(
                  height: 50,
                ),
                const BotRecommendationFaq(),
                const SizedBox(
                  height: 28,
                ),
                _needHelpButton
              ],
            ),
          )),
    );
  }

  Widget get _needHelpButton => UnconstrainedBox(
      child: ExtraInfoButton(
          label: 'Need Help?',
          suffixIcon: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: AskLoraColors.primaryMagenta,
              size: 18,
            ),
          ),
          onTap: () {}));

  Widget _header(BuildContext context) => Padding(
        padding: AppValues.screenHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(
              'Investments for you, by you',
              style:
                  AskLoraTextStyles.h2.copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextNew(
              'Hi Sassy Chris! Check out my 20 recommended Botstocks just for you.',
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextNew(
              'Select a Botstock to trade it for FREE!',
              style: AskLoraTextStyles.subtitle2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const BotLearnMoreBottomSheet(),
              ),
              child: CustomTextNew(
                'LEARN MORE!',
                style: AskLoraTextStyles.subtitle1.copyWith(
                  color: AskLoraColors.charcoal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _loraMemojiWidget => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            const LoraMemojiHeader(
                text: 'Not feeling it? Try something different.'),
            PrimaryButton(label: 'CHANGE INVESTMENT STYLE', onTap: () {}),
          ],
        ),
      );

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
