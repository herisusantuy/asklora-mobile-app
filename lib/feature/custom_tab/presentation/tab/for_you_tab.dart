import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../bot_stock/domain/bot_recommendation_model.dart';
import '../../../bot_stock/presentation/bot_recommendation/detail/bot_recommendation_detail_screen.dart';
import '../../../tabs/for_you/bloc/for_you_bloc.dart';
import '../../../tabs/for_you/for_you_screen_form.dart';
import '../../../tabs/for_you/repository/for_you_repository.dart';

enum ForYouTabPage { forYou, botDetail }

class ForYouTab extends StatelessWidget {
  const ForYouTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NavigationBloc<ForYouTabPage>(ForYouTabPage.forYou),
        ),
        BlocProvider(
          create: (_) => ForYouBloc(forYouRepository: ForYouRepository())
            ..add(GetInvestmentStyleState()),
        )
      ],
      child: BlocBuilder<NavigationBloc<ForYouTabPage>,
          NavigationState<ForYouTabPage>>(
        builder: (context, state) {
          switch (state.page) {
            case ForYouTabPage.forYou:
              return const ForYouScreenForm();
            case ForYouTabPage.botDetail:
              return BotRecommendationDetailScreen(
                botRecommendationModel:
                    state.arguments as BotRecommendationModel,
              );
          }
        },
      ),
    );
  }
}
