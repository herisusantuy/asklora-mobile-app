import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/secondary/extra_info_button.dart';
import '../../../../../core/presentation/custom_modal_bottom_sheet.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_bottom_sheet.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../../balance/deposit/utils/deposit_utils.dart';
import '../../../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../../../bot_stock/utils/bot_stock_utils.dart';
import '../../../../learning/learning_bot_stock_screen.dart';
import '../../../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../../../onboarding/kyc/presentation/widgets/custom_stepper/custom_stepper.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../onboarding/ppi/presentation/ppi_screen.dart';
import '../../../../orders/regular/presentation/widgets/custom_bottom_sheet_card_widget.dart';
import 'domain/on_boarding_status_model.dart';
import 'widgets/milestones_step_details.dart';

part 'widgets/on_boarding_status_button.dart';

class OnBoardingStatus extends StatelessWidget {
  final Color valueColor;
  final Color backgroundColor;
  final double edgeRadius;
  final int intersectCount;
  final int arrowPointingOnSection;

  const OnBoardingStatus(
      {this.valueColor = AskLoraColors.primaryMagenta,
      this.backgroundColor = AskLoraColors.charcoal,
      this.arrowPointingOnSection = 1,
      this.edgeRadius = 10,
      this.intersectCount = 2,
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
                      style: AskLoraTextStyles.h4Italic,
                    ),
                  ),
                  ExtraInfoButton(
                      label: 'Milestone 1 / 3',
                      suffixIcon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AskLoraColors.primaryMagenta,
                        size: 15,
                      ),
                      onTap: () => customModalBottomSheet(
                            context,
                            title: 'Milestones',
                            content: const MilestonesStepDetails(),
                          ),
                      buttonExtraInfoSize: ButtonExtraInfoSize.small)
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
                      valueColor: AlwaysStoppedAnimation<Color>(valueColor),
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
              OnBoardingStatusButton(
                arrowPointingOnSection: arrowPointingOnSection,
                onTap: onBoardingStatusModel.onTap,
                intersectCount: intersectCount,
                subTitle: onBoardingStatusModel.subTitle,
              ),
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
          title: 'START INVESTING',
          subTitle: 'Define Investment Style',
          onTap: () => PpiScreen.open(context,
              arguments: const Pair(QuestionPageType.investmentStyle,
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
          onTap: () => DepositWelcomeScreen.open(
              context: context, depositType: DepositType.firstTime),
          progress: 0.25,
        );
      case UserJourney.learnBotPlank:
        return OnBoardingStatusModel(
          title: 'START INVESTING',
          subTitle: 'Learn to Invest with Bot - Plank',
          onTap: () => LearningBotStockScreen.open(
            context: context,
            botType: BotType.plank,
          ),
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
