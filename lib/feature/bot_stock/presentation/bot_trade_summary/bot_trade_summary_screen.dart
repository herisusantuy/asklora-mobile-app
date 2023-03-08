import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../../core/utils/extensions.dart';
import '../../../tabs/tabs_screen.dart';
import '../../bloc/bot_stock_bloc.dart';
import '../../domain/bot_recommendation_model.dart';
import '../../repository/bot_stock_repository.dart';
import '../../utils/bot_stock_bottom_sheet.dart';
import '../bot_stock_result_screen.dart';
import '../widgets/bot_stock_form.dart';
import '../widgets/pair_column_text.dart';

class BotTradeSummaryScreen extends StatelessWidget {
  static const String route = '/bot_trade_summary_screen';
  final Pair<BotRecommendationModel, double> arguments;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const BotTradeSummaryScreen({required this.arguments, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository()),
      child: BlocListener<BotStockBloc, BotStockState>(
        listenWhen: (previous, current) =>
            previous.tradeBotStockResponse != current.tradeBotStockResponse,
        listener: (context, state) {
          if (state.tradeBotStockResponse.state == ResponseState.loading) {
            CustomLoadingOverlay.of(context).show();
          } else {
            CustomLoadingOverlay.of(context).dismiss();
            if (state.tradeBotStockResponse.state == ResponseState.success) {
              context.read<AppBloc>().add(
                    const SaveUserJourney(UserJourney.deposit),
                  );
              if (arguments.left.freeBot) {
                TabsScreen.openAndRemoveAllRoute(context,
                    initialTabScreenPage: TabScreenPage.portfolio);
                BotStockBottomSheet.freeBotStockSuccessfullyAdded(context);
              } else {
                BotStockResultScreen.open(
                    context: context,
                    arguments: const Pair('Trade Request Received',
                        'Pull-up TSLA will be started at 14:00, 2022/03/12.'));
              }
            } else if (state.tradeBotStockResponse.state ==
                ResponseState.error) {
              BotStockBottomSheet.insufficientBalance(context);
            }
          }
        },
        child: BotStockForm(
            useHeader: true,
            title: arguments.left.tickerName,
            content: Column(
              children: [
                RoundColoredBox(
                  content: Column(
                    children: [
                      PairColumnText(
                          leftTitle: 'Investment Amount (HKD)',
                          rightTitle: 'Bot Management Fee (HKD)',
                          leftSubTitle:
                              arguments.right.convertToCurrencyDecimal(),
                          rightSubTitle: 'Free'),
                      _spaceBetweenInfo,
                      const PairColumnText(
                          leftTitle: 'Stop Loss Level',
                          rightTitle: 'Take Profit Level',
                          leftSubTitle: 'N/A',
                          rightSubTitle: '240.00'),
                      _spaceBetweenInfo,
                      const PairColumnText(
                          leftTitle: 'Market Price',
                          rightTitle: 'Investment Period',
                          leftSubTitle: '223.07',
                          rightSubTitle: '3 months'),
                      _spaceBetweenInfo,
                      const PairColumnText(
                          leftTitle: 'Start Time',
                          rightTitle: 'End Time',
                          leftSubTitle: '03/12 15:30 ET',
                          rightSubTitle: '03/26 15:30 ET'),
                    ],
                  ),
                  title: arguments.left.freeBot
                      ? 'Free Botstock Trade Summary'
                      : 'Trade Summary',
                ),
                const SizedBox(
                  height: 19,
                ),
                if (arguments.left.freeBot)
                  RoundColoredBox(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 13),
                    backgroundColor: AskLoraColors.lightGreen,
                    content: Row(
                      children: [
                        const LoraMemojiWidget(
                          loraMemojiType: LoraMemojiType.lora1,
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: CustomTextNew(
                            'You will have more flexbility in the next real trade. Come on, this is FREE!',
                            style: AskLoraTextStyles.body1
                                .copyWith(color: AskLoraColors.charcoal),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
            bottomButton: Builder(
                builder: (context) => Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 30),
                      child: PrimaryButton(
                        label: 'CONFIRM',
                        onTap: () => context.read<BotStockBloc>().add(
                            TradeBotStock(
                                botRecommendationModel: arguments.left,
                                tradeBotStockAmount: arguments.right)),
                      ),
                    ))),
      ),
    );
  }

  static void open(
          {required BuildContext context,
          required Pair<BotRecommendationModel, double> arguments}) =>
      Navigator.pushNamed(context, route, arguments: arguments);
}
