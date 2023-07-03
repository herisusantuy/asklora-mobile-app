import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../../balance/deposit/utils/deposit_utils.dart';
import '../../../../bot_stock/utils/bot_stock_utils.dart';
import '../../../../learning/learning_bot_stock_screen.dart';
import '../../../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../onboarding/ppi/presentation/ppi_screen.dart';
import 'domain/on_boarding_status_model.dart';

part 'widgets/on_boarding_status_button.dart';

class OnBoardingStatus extends StatelessWidget {
  final Color valueColor;
  final Color backgroundColor;
  final double edgeRadius;
  final int intersectCount;
  final int arrowPointingOnSection;
  final Color completeColor;

  const OnBoardingStatus(
      {this.valueColor = AskLoraColors.primaryMagenta,
      this.backgroundColor = AskLoraColors.charcoal,
      this.arrowPointingOnSection = 1,
      this.edgeRadius = 10,
      this.intersectCount = 2,
      this.completeColor = AskLoraColors.primaryGreen,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.userJourney != current.userJourney,
        builder: (context, state) {
          final OnBoardingStatusModel onBoardingStatusModel =
              _onBoardingStatusModel(context, state.userJourney);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextNew(
                      onBoardingStatusModel.title,
                      style: AskLoraTextStyles.h4,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(edgeRadius)),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: onBoardingStatusModel.progress,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          onBoardingStatusModel.progress != 1
                              ? valueColor
                              : completeColor),
                      backgroundColor: backgroundColor,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: getIntersectContainer),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              onBoardingStatusModel.progress != 1
                  ? OnBoardingStatusButton(
                      arrowPointingOnSection:
                          state.userJourney == UserJourney.kyc ||
                                  state.userJourney == UserJourney.deposit
                              ? arrowPointingOnSection + 1
                              : arrowPointingOnSection,
                      onTap: onBoardingStatusModel.onTap,
                      intersectCount: intersectCount,
                      subTitle: onBoardingStatusModel.subTitle,
                    )
                  : const SizedBox.shrink(),
            ],
          );
        });
  }

  List<Widget> get getIntersectContainer {
    List<Widget> children = [];
    for (int i = 0; i < intersectCount; i++) {
      children.add(
        Container(
          height: 10,
          width: 4,
          color: Colors.white,
        ),
      );
    }
    return children;
  }

  OnBoardingStatusModel _onBoardingStatusModel(
      BuildContext context, UserJourney userJourney) {
    switch (userJourney) {
      case UserJourney.investmentStyle:
        return OnBoardingStatusModel(
          title: 'Great start!',
          subTitle: S.of(context).defineInvestmentStyle,
          onTap: () => PpiScreen.open(context,
              arguments: const Pair(QuestionPageType.investmentStyle,
                  QuestionPageStep.investmentStyle)),
          progress: 0.17,
        );
      case UserJourney.kyc:
        return OnBoardingStatusModel(
          title: 'Halfway there!',
          subTitle: 'Open Investment Account',
          onTap: () => KycScreen.open(context),
          progress: 0.5,
        );
      case UserJourney.deposit:
        return OnBoardingStatusModel(
          title: 'Almost finished!',
          subTitle: 'Deposit funds and start investing',
          onTap: () => DepositWelcomeScreen.open(
              context: context, depositType: DepositType.firstTime),
          progress: 0.67,
        );
      case UserJourney.learnBotPlank:
        return OnBoardingStatusModel(
          title: 'Start investing',
          subTitle: 'Learn to Invest with Bot - Plank',
          onTap: () => LearningBotStockScreen.open(
            context: context,
            botType: BotType.plank,
          ),
          progress: 1,
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
