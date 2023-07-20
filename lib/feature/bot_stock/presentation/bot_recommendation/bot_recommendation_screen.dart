import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/presentation/buttons/secondary/extra_info_button.dart';
import '../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../core/presentation/lora_popup_message/lora_popup_message.dart';
import '../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/shimmer.dart';
import '../../../../generated/l10n.dart';
import '../../../ai/investment_style_question/presentation/ai_investment_style_question_welcome_screen.dart';
import '../../../tabs/bloc/tab_screen_bloc.dart';
import '../../../tabs/for_you/for_you_screen_form.dart';
import '../../../tabs/home/home_screen_form.dart';
import '../../bloc/bot_stock_bloc.dart';
import '../../domain/bot_recommendation_model.dart';
import '../../utils/bot_stock_utils.dart';
import '../widgets/custom_expansion_panel.dart';
import 'detail/bot_recommendation_detail_screen.dart';

part 'widgets/bot_learn_more_bottom_sheet.dart';

part 'widgets/bot_recommendation_card.dart';

part 'widgets/bot_recommendation_card_shimmer.dart';

part 'widgets/bot_recommendation_faq.dart';

part 'widgets/bot_recommendation_list.dart';

class BotRecommendationScreen extends StatelessWidget {
  final bool enableBackNavigation;

  const BotRecommendationScreen({this.enableBackNavigation = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        enableBackNavigation: enableBackNavigation,
        backgroundColor: AskLoraColors.white,
        body: Padding(
          padding: EdgeInsets.only(top: enableBackNavigation ? 70 : 20),
          child: BlocBuilder<BotStockBloc, BotStockState>(
            buildWhen: (previous, current) =>
                previous.botRecommendationResponse !=
                current.botRecommendationResponse,
            builder: (context, state) => CustomLayoutWithBlurPopUp(
              loraPopUpMessageModel: LoraPopUpMessageModel(
                title: S.of(context).errorGettingInformationTitle,
                subTitle: S
                    .of(context)
                    .errorGettingInformationInvestmentDetailSubTitle,
                primaryButtonLabel: S.of(context).buttonReloadPage,
                onSecondaryButtonTap: () => Navigator.pop(context),
                onPrimaryButtonTap: () => UserJourney.onAlreadyPassed(
                    context: context,
                    target: UserJourney.freeBotStock,
                    onTrueCallback: () => context
                        .read<BotStockBloc>()
                        .add(FetchBotRecommendation()),
                    onFalseCallback: () => context
                        .read<BotStockBloc>()
                        .add(FetchFreeBotRecommendation())),
              ),
              showPopUp:
                  state.botRecommendationResponse.state == ResponseState.error,
              content: ListView(
                padding: const EdgeInsets.only(bottom: 35),
                children: [
                  _header(
                      context: context,
                      userJourney: context.read<AppBloc>().state.userJourney),
                  BotRecommendationList(
                    verticalMargin: 14,
                    botStockState: state,
                  ),
                  if (UserJourney.compareUserJourney(
                      context: context, target: UserJourney.freeBotStock))
                    _buttonChangeInvestmentStyle(context),
                  const SizedBox(
                    height: 50,
                  ),
                  const BotRecommendationFaq(),
                  const SizedBox(
                    height: 28,
                  ),
                  const UnconstrainedBox(
                      child: HomeScreenNeedHelpButtonWidget())
                ],
              ),
            ),
          ),
        ));
  }

  Widget _header(
          {required BuildContext context, required UserJourney userJourney}) =>
      Padding(
        padding: AppValues.screenHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(
              S.of(context).botRecommendationScreenTitle,
              style:
                  AskLoraTextStyles.h2.copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                CustomTextNew(
                  S.of(context).notFeelingIt,
                  style: AskLoraTextStyles.subtitle2
                      .copyWith(color: AskLoraColors.primaryMagenta),
                ),
                const SizedBox(
                  width: 5,
                ),
                ExtraInfoButton(
                  label: S.of(context).defineAgain,
                  buttonExtraInfoSize: ButtonExtraInfoSize.small,
                  onTap: () => context
                      .read<NavigationBloc<ForYouPage>>()
                      .add(const PageChanged(ForYouPage.investmentStyle)),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (userJourney == UserJourney.freeBotStock)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextNew(
                    'Hi! Check out my 20 recommended Botstocks just for you.',
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
                      'Redemption Instructions',
                      style: AskLoraTextStyles.subtitle1.copyWith(
                        color: AskLoraColors.charcoal,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      );

  Widget _buttonChangeInvestmentStyle(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextNew(S.of(context).notFeelingIt,
                style: AskLoraTextStyles.h4, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            PrimaryButton(
              label: S.of(context).buttonChangeInvestmentStyle,
              onTap: () => context
                  .read<NavigationBloc<ForYouPage>>()
                  .add(const PageChanged(ForYouPage.investmentStyle)),
            ),
          ],
        ),
      );
}
