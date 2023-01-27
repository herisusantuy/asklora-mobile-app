import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../core/presentation/custom_scaffold.dart';
import '../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../bot_stock/utils/bot_stock_utils.dart';
import '../onboarding/ppi/domain/ppi_user_response.dart';
import 'demonstration_bot/presentation/detail/demonstration_bot_detail_screen.dart';
import 'demonstration_bot/presentation/demonstration_bot_screen.dart';
import 'demonstration_bot/presentation/trade/demonstration_bot_trade.dart';
import 'demonstration_question/bloc/demonstration_question_bloc.dart';
import 'demonstration_question/presentation/demonstration_question_screen.dart';
import 'demonstration_question/repository/demonstration_question_repository.dart';
import 'learning_bot_stock_welcome_screen.dart';

enum LearningBotStockPageStep { welcome, question, botList, botDetail, trade }

class LearningBotStockScreen extends StatelessWidget {
  final BotType botType;
  final JustTheController tooltipController = JustTheController();
  final LearningBotStockPageStep initialLearningBotStockPageStep;

  LearningBotStockScreen(
      {this.initialLearningBotStockPageStep = LearningBotStockPageStep.welcome,
      required this.botType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => NavigationBloc<LearningBotStockPageStep>(
                initialLearningBotStockPageStep)),
        BlocProvider(
            create: (_) => DemonstrationQuestionBloc(
                  demonstrationQuestionRepository:
                      DemonstrationQuestionRepository(),
                )..add(FetchQuestion())),
      ],
      child: CustomScaffold(
        enableBackNavigation: false,
        body: Builder(builder: (context) {
          return BlocListener<NavigationBloc<LearningBotStockPageStep>,
                  NavigationState<LearningBotStockPageStep>>(
              listenWhen: (_, current) => current.lastPage == true,
              listener: (context, state) => Navigator.pop(context),
              child: _getPages);
        }),
      ),
    );
  }

  Widget get _getPages {
    final RecommendedBot recommendedBot = demonstrationBots.firstWhere(
        (element) =>
            element.selectable == true && element.botType == botType.value);
    return BlocBuilder<NavigationBloc<LearningBotStockPageStep>,
            NavigationState<LearningBotStockPageStep>>(
        buildWhen: (previous, current) => previous.page != current.page,
        builder: (context, state) {
          switch (state.page) {
            case LearningBotStockPageStep.welcome:
              return LearningBotStockWelcomeScreen(
                botType: botType,
              );
            case LearningBotStockPageStep.question:
              return DemonstrationQuestionScreen(
                tooltipController: tooltipController,
              );
            case LearningBotStockPageStep.botList:
              return DemonstrationBotScreen(
                botType: botType,
                tooltipController: tooltipController,
              );
            case LearningBotStockPageStep.botDetail:
              return DemonstrationBotDetailScreen(
                recommendedBot: recommendedBot,
                botType: botType,
              );
            case LearningBotStockPageStep.trade:
              return const DemonstrationBotTrade();
            default:
              return const SizedBox.shrink();
          }
        });
  }
}
