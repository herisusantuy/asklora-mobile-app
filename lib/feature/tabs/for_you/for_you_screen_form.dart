import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/domain/base_response.dart';
import '../../../core/domain/pair.dart';
import '../../../core/presentation/bot_stock_background_with_pop_up.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../bot_stock/presentation/bot_recommendation/bot_recommendation_screen.dart';
import '../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../onboarding/ppi/presentation/ppi_screen.dart';
import 'bloc/for_you_bloc.dart';
import 'investment_style/presentation/for_you_investment_style_screen.dart';
import 'repository/for_you_repository.dart';

enum ForYouPage { investmentStyle, botRecommendation }

class ForYouScreenForm extends StatelessWidget {
  const ForYouScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.userJourney != current.userJourney,
        builder: (context, state) {
          if (state.userJourney == UserJourney.investmentStyle ||
              state.userJourney == UserJourney.kyc ||
              state.userJourney == UserJourney.freeBotStock) {
            final LoraPopUpMessageModel loraPopUpMessageModel =
                _getLoraPopUpMessageModel(context, state.userJourney);
            return BotStockBackgroundWithPopUp(
                shouldScrollable: false,
                header: CustomTextNew(
                  'Investments for you, by you',
                  style: AskLoraTextStyles.h2
                      .copyWith(color: AskLoraColors.charcoal),
                ),
                popUpTitle: loraPopUpMessageModel.title,
                popUpSubTitle: loraPopUpMessageModel.subTitle,
                popUpButtonLabel: loraPopUpMessageModel.primaryButtonLabel,
                onPopUpButtonTap: loraPopUpMessageModel.onPrimaryButtonTap);
          } else {
            return _getForYouPage;
          }
        });
  }

  Widget get _getForYouPage => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ForYouBloc(forYouRepository: ForYouRepository())
              ..add(GetInvestmentStyleState()),
          ),
        ],
        child: BlocConsumer<ForYouBloc, ForYouState>(
          builder: (BuildContext context, state) {
            if (state.response.state == ResponseState.success) {
              return BlocProvider(
                create: (_) => NavigationBloc<ForYouPage>(state.response.data!
                    ? ForYouPage.botRecommendation
                    : ForYouPage.investmentStyle),
                child: BlocBuilder<NavigationBloc<ForYouPage>,
                        NavigationState<ForYouPage>>(
                    buildWhen: (previous, current) =>
                        previous.page != current.page,
                    builder: (context, state) {
                      switch (state.page) {
                        case ForYouPage.investmentStyle:
                          return const ForYouInvestmentStyleScreen();
                        case ForYouPage.botRecommendation:
                          return const BotRecommendationScreen(
                            enableBackNavigation: false,
                          );
                      }
                    }),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (context, state) {
            if (state.response.state == ResponseState.loading) {
              CustomLoadingOverlay.of(context).show();
            } else {
              CustomLoadingOverlay.of(context).dismiss();
            }
          },
        ),
      );

  LoraPopUpMessageModel _getLoraPopUpMessageModel(
      BuildContext context, UserJourney userJourney) {
    if (UserJourney.compareUserJourney(
        context: context, target: UserJourney.freeBotStock)) {
      return LoraPopUpMessageModel(
          title: 'No Botstock recommendation.',
          subTitle:
              'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
          primaryButtonLabel: 'DEFINE INVESTMENT STYLE',
          onPrimaryButtonTap: () => context
              .read<NavigationBloc<ForYouPage>>()
              .add(const PageChanged(ForYouPage.investmentStyle)));
    } else {
      switch (userJourney) {
        case UserJourney.investmentStyle:
          return LoraPopUpMessageModel(
              title: 'No Botstock recommendation.',
              subTitle:
                  'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
              primaryButtonLabel: 'DEFINE INVESTMENT STYLE',
              onPrimaryButtonTap: () => PpiScreen.open(context,
                  arguments: Pair(QuestionPageType.investmentStyle,
                      QuestionPageStep.investmentStyle)));
        case UserJourney.kyc:
          return LoraPopUpMessageModel(
              title: 'No Botstock recommendation.',
              subTitle:
                  'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
              primaryButtonLabel: 'OPEN INVESTMENT ACCOUNT',
              onPrimaryButtonTap: () => KycScreen.open(context));
        case UserJourney.freeBotStock:
          return LoraPopUpMessageModel(
              title: 'No Botstock recommendation.',
              subTitle:
                  'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
              primaryButtonLabel: 'REDEEM YOUR BOTSTOCK NOW',
              onPrimaryButtonTap: () =>
                  GiftBotStockWelcomeScreen.open(context));
        default:
          return LoraPopUpMessageModel(
              title: '',
              subTitle: '',
              primaryButtonLabel: '',
              onPrimaryButtonTap: () {});
      }
    }
  }
}
