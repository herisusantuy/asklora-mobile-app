import 'package:asklora_mobile_chart/samples/line_chart_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../../bot_stock/presentation/bot_recommendation/detail/widgets/bot_recommendation_detail_content.dart';
import '../../../../../bot_stock/presentation/bot_recommendation/detail/widgets/bot_recommendation_detail_header.dart';
import '../../../../../bot_stock/presentation/widgets/gift_bot_stock_base_widget.dart';
import '../../../../../bot_stock/repository/bot_stock_repository.dart';
import '../../../../../bot_stock/utils/bot_stock_utils.dart';
import '../../../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../learning_screen.dart';
import '../../bloc/demonstration_bot_bloc.dart';
import '../../utils/demonstration_bot_utils.dart';

part 'widgets/demonstration_bot_chart.dart';

class DemonstrationBotDetailScreen extends StatelessWidget {
  final RecommendedBot recommendedBot;
  final BotType botType;

  const DemonstrationBotDetailScreen(
      {required this.recommendedBot, required this.botType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<NavigationBloc<LearningPageStep>>().add(const PagePop());
        return false;
      },
      child: BlocProvider(
        create: (_) =>
            DemonstrationBotBloc(botStockRepository: BotStockRepository())
              ..add(FetchChartData()),
        child: CustomScaffold(
            onTapBack: () => context
                .read<NavigationBloc<LearningPageStep>>()
                .add(const PagePop()),
            body: Column(
              children: [
                BotRecommendationDetailHeader(
                  botType: botType,
                  recommendedBot: recommendedBot,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GiftBotStockBaseWidget(
                      padding: EdgeInsets.zero,
                      content: BotRecommendationDetailContent(
                        recommendedBot: recommendedBot,
                        botType: botType,
                        chart: const DemonstrationBotChart(),
                      ),
                      bottomButton: Padding(
                        padding: AppValues.screenHorizontalPadding
                            .copyWith(top: 24, bottom: 30),
                        child: PrimaryButton(
                          label: 'TRADE',
                          onTap: () => DemonstrationBottomSheet.show(
                            context,
                            onPrimaryButtonTap: () {
                              Navigator.pop(context);
                              context
                                  .read<NavigationBloc<LearningPageStep>>()
                                  .add(const PageChanged(
                                      LearningPageStep.trade));
                            },
                            onSecondaryButtonTap: () => Navigator.pop(context),
                            title: 'Trade any amount above USD 200',
                            subTitle:
                                'Bot will buy fractions of a share for you',
                            primaryButtonLabel: 'SEE TRADE DEMONSTRATION',
                            secondaryButtonLabel: 'CANCEL',
                          ),
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
