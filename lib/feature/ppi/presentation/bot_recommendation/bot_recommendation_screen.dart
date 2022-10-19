import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_loading_widget.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/ppi_user_response.dart';
import '../../repository/bot_recommendation_repository.dart';
import '../widget/header.dart';
import '../widget/question_navigation_button_widget.dart';
import 'bloc/bot_recommendation_bloc.dart';

part 'bot_card.dart';

class BotRecommendationScreen extends StatelessWidget {
  final List<RecommendedBot> defaultBotsSelected;

  const BotRecommendationScreen({this.defaultBotsSelected = const [], Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget(
        header: const SizedBox.shrink(),
        child: BlocProvider(
            create: (_) => BotRecommendationBloc(
                defaultBotsSelected: defaultBotsSelected,
                botRecommendationRepository: BotRecommendationRepository())
              ..add(LoadBots()),
            child: Column(
              children: [
                const Header(
                    key: Key('bot_recommendation_header'),
                    header: 'Recommendations',
                    subHeader:
                        'Lora’s recommendations are ranked by the suitability of the bot-stock to your investment styles:'),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: BlocBuilder<BotRecommendationBloc,
                      BotRecommendationState>(builder: (context, state) {
                    if (state.response.state == ResponseState.success) {
                      List<RecommendedBot> recommendedBots =
                          state.response.data;
                      return ListView.builder(
                          key: const Key('bot_list'),
                          itemCount: recommendedBots.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BotCard(
                                key: Key(index.toString()),
                                onTap: () => context
                                    .read<BotRecommendationBloc>()
                                    .add(BotSelected(recommendedBots[index])),
                                recommendedBot: recommendedBots[index],
                                index: index,
                                selected: state.botsSelected
                                    .contains(recommendedBots[index]));
                          });
                    } else {
                      return const CustomLoadingWidget();
                    }
                  }),
                ),
                BlocBuilder<BotRecommendationBloc, BotRecommendationState>(
                    buildWhen: (previous, current) =>
                        previous.botsSelected != current.botsSelected,
                    builder: (context, state) => QuestionNavigationButtonWidget(
                          disable: state.botsSelected.isEmpty,
                          key: const Key('question_navigation_button_widget'),
                          onSubmitSuccess: () {},
                          onNext: () => context
                              .read<BotRecommendationBloc>()
                              .add(SubmitBots()),
                          onCancel: () => context
                              .read<NavigationBloc<QuestionPageStep>>()
                              .add(const PagePop()),
                        )),
              ],
            )));
  }
}
