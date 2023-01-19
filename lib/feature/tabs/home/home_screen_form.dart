import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../../core/domain/pair.dart';
import '../../../core/presentation/bot_badge/lora_pop_up_message_with_bot_badge.dart';
import '../../../core/presentation/lora_popup_message.dart';
import '../../../core/presentation/lora_rounded_corner_banner.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../bot_stock/utils/bot_stock_utils.dart';
import '../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../onboarding/ppi/presentation/ppi_screen.dart';
import 'custom_header/custom_sliver_persistent_header.dart';
import 'widgets/on_boarding_status.dart';

class HomeScreenForm extends StatelessWidget {
  const HomeScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverPersistentHeader(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OnBoardingStatus(
                    onBoardingStatusModel: _onBoardingStatusModel(
                        context, context.read<AppBloc>().state.userJourney),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: LoraRoundedCornerBanner(),
                ),
                const SizedBox(height: 100),
                SizedBox(
                  height: 244,
                  width: 244,
                  child: RadarChart(RadarChartData(
                      tickCount: 0,
                      radarBackgroundColor: AskLoraColors.whiteSmoke,
                      titleTextStyle: AskLoraTextStyles.subtitle2,
                      extendedBorderStyle: ExtendedBorderStyle.dash,
                      tickBorderData:
                          const BorderSide(color: Colors.blue, width: 2),
                      radarBorderData: const BorderSide(
                          color: AskLoraColors.primaryGreen, width: 3),
                      gridBorderData: const BorderSide(
                          color: AskLoraColors.gray, width: 1.5),
                      titlePositionPercentageOffset: .5,
                      getTitle: (index, angle) {
                        switch (index) {
                          case 0:
                            return const RadarChartTitle(
                                text: 'Risk Tolerance', angle: 0);
                          case 2:
                            return const RadarChartTitle(
                                text: 'Patient', angle: 0);
                          case 1:
                            return const RadarChartTitle(
                                text: 'Detailed', angle: 0);
                          default:
                            return const RadarChartTitle(text: '');
                        }
                      },
                      dataSets: [
                        RadarDataSet(
                            entryRadius: 6,
                            fillColor: Colors.transparent,
                            borderColor: AskLoraColors.primaryGreen,
                            dataEntries: [
                              const RadarEntry(value: 0),
                              const RadarEntry(value: 0),
                              const RadarEntry(value: 0),
                            ])
                      ])),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: LoraPopUpMessage(
                      backgroundColor: AskLoraColors.primaryGreen,
                      title: 'Your first Botstock is on me!',
                      subTitle:
                          'Unlock your painless investing journey and receive a free gift Botstock.',
                      buttonLabel: 'SIGN UP'),
                ),
                const SizedBox(height: 20),
                const LoraPopUpMessageWithBotBadge(
                  backgroundColor: AskLoraColors.whiteSmoke,
                  withLoraImage: true,
                  badgePosition: BadgePosition.belowSubtitle,
                  title: 'No traded BotStocks.',
                  subTitle:
                      'You can manage all your investments here after you start trading. Create an account and start trading.',
                  botTypes: [BotType.pullUp, BotType.squat],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  OnBoardingStatusModel _onBoardingStatusModel(
      BuildContext context, UserJourney userJourney) {
    switch (userJourney) {
      case UserJourney.createAccount:
        return OnBoardingStatusModel(
          title: 'START INVESTING',
          subTitle: 'Create an Account',
          onTap: () => SignUpScreen.open(context),
          progress: 0.05,
        );
      case UserJourney.investmentStyle:
        return OnBoardingStatusModel(
          title: 'START INVESTING',
          subTitle: 'Define Investment Style',
          onTap: () => PpiScreen.open(context,
              arguments: Pair(QuestionPageType.investmentStyle,
                  QuestionPageStep.investmentStyle)),
          progress: 0.1,
        );
      case UserJourney.kyc:
        return OnBoardingStatusModel(
          title: 'START INVESTING',
          subTitle: 'Open Investment Account',
          onTap: () => KycScreen.open(context),
          progress: 0.15,
        );
      case UserJourney.freeBotStock:
        return OnBoardingStatusModel(
          title: 'START INVESTING',
          subTitle: 'Get the First Botstock for Free',
          onTap: () => GiftBotStockWelcomeScreen.open(context),
          progress: 0.2,
        );
      case UserJourney.deposit:
        return OnBoardingStatusModel(
          title: 'START INVESTING',
          subTitle: 'Deposit funds and start investing',
          onTap: () {},
          progress: 0.25,
        );
      case UserJourney.learnBotPlank:
        return OnBoardingStatusModel(
          title: 'START INVESTING',
          subTitle: 'Learn to Invest with Bot - Plank',
          onTap: () {},
          progress: 0.3,
        );
      default:
        return OnBoardingStatusModel(
          title: '',
          subTitle: '',
          onTap: () {},
          progress: 0,
        );
    }
  }
}

class OnBoardingStatusModel {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final double progress;

  OnBoardingStatusModel(
      {required this.title,
      required this.subTitle,
      required this.onTap,
      required this.progress});
}
