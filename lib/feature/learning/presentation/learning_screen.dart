import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bot_stock/utils/bot_stock_utils.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import 'demonstration_bot/presentation/detail/demonstration_bot_detail_screen.dart';
import 'demonstration_bot/presentation/demonstration_bot_screen.dart';
import 'demonstration_bot/presentation/trade/demonstration_bot_trade.dart';
import 'demonstration_question/bloc/demonstration_question_bloc.dart';
import 'demonstration_question/presentation/demonstration_question_screen.dart';
import 'demonstration_question/repository/demonstration_question_repository.dart';
import 'learning_welcome_screen.dart';

enum LearningPageStep { welcome, question, botList, botDetail, trade }

class LearningScreen extends StatelessWidget {
  final RecommendedBot recommendedBot;
  final JustTheController tooltipController = JustTheController();
  final LearningPageStep initialLearningPageStep;

  LearningScreen(
      {this.initialLearningPageStep = LearningPageStep.welcome,
      required this.recommendedBot,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                NavigationBloc<LearningPageStep>(LearningPageStep.welcome)),
        BlocProvider(
            create: (_) => DemonstrationQuestionBloc(
                  demonstrationQuestionRepository:
                      DemonstrationQuestionRepository(),
                )..add(FetchQuestion())),
      ],
      child: CustomScaffold(
        enableBackNavigation: false,
        body: Builder(builder: (context) {
          return BlocListener<NavigationBloc<LearningPageStep>,
                  NavigationState<LearningPageStep>>(
              listenWhen: (_, current) => current.lastPage == true,
              listener: (context, state) => Navigator.pop(context),
              child: _getPages);
        }),
      ),
    );
  }

  Widget get _getPages {
    final BotType botType = BotType.findByString(recommendedBot.botType);
    return BlocBuilder<NavigationBloc<LearningPageStep>,
            NavigationState<LearningPageStep>>(
        buildWhen: (previous, current) => previous.page != current.page,
        builder: (context, state) {
          switch (state.page) {
            case LearningPageStep.welcome:
              return LearningWelcomeScreen(
                botType: botType,
              );
            case LearningPageStep.question:
              return DemonstrationQuestionScreen(
                tooltipController: tooltipController,
              );
            case LearningPageStep.botList:
              return DemonstrationBotScreen(
                tooltipController: tooltipController,
              );
            case LearningPageStep.botDetail:
              return DemonstrationBotDetailScreen(
                recommendedBot: recommendedBot,
                botType: botType,
              );
            case LearningPageStep.trade:
              return const DemonstrationBotTrade();
            default:
              return const SizedBox.shrink();
          }
        });
  }
}
