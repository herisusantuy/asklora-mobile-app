import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../bloc/bot_stock_bloc.dart';
import '../../repository/bot_stock_repository.dart';
import '../portfolio/portfolio_screen.dart';
import '../widgets/bot_bottom_sheet_widget.dart';
import '../widgets/gift_bot_stock_base_widget.dart';
import '../widgets/pair_column_text.dart';

class BotTradeSummaryScreen extends StatelessWidget {
  static const String route = '/bot_trade_summary_screen';
  final RecommendedBot recommendedBot;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const BotTradeSummaryScreen({required this.recommendedBot, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository()),
      child: BlocListener<BotStockBloc, BotStockState>(
        listenWhen: (previous, current) =>
            previous.getFreeBotStockResponse != current.getFreeBotStockResponse,
        listener: (context, state) {
          if (state.getFreeBotStockResponse.state == ResponseState.loading) {
            CustomLoadingOverlay.show(context);
          } else if (state.getFreeBotStockResponse.state ==
              ResponseState.success) {
            CustomLoadingOverlay.dismiss();
            context
                .read<AppBloc>()
                .add(const SaveUserJourney(UserJourney.deposit));
            PortfolioScreen.open(context);
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: (context),
                builder: (_) => BotBottomSheetWidget(
                      title:
                          'Your free Botstock has been added to your portfolio successfully!',
                      primaryButtonLabel: 'DEPOSIT TO START REAL TRADE',
                      secondaryButtonLabel: 'NOT NOW',
                      onPrimaryButtonTap: () {},
                      onSecondaryButtonTap: () => Navigator.pop(context),
                    ));
          }
        },
        child: CustomScaffold(
            body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: CustomTextNew(
                  recommendedBot.tickerName,
                  style: AskLoraTextStyles.h5
                      .copyWith(color: AskLoraColors.charcoal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GiftBotStockBaseWidget(
                  content: Column(
                    children: [
                      RoundColoredBox(
                        content: Column(
                          children: [
                            const PairColumnText(
                                title1: 'Investment Amount (USD)',
                                title2: 'Trading Fee (USD)',
                                subTitle1: '68.00',
                                subTitle2: 'Free'),
                            _spaceBetweenInfo,
                            const PairColumnText(
                                title1: 'Stop Loss Level',
                                title2: 'Take Profit Level',
                                subTitle1: 'N/A',
                                subTitle2: '240.00'),
                            _spaceBetweenInfo,
                            const PairColumnText(
                                title1: 'Market Price',
                                title2: 'Investment Period',
                                subTitle1: '223.07',
                                subTitle2: '3 months'),
                            _spaceBetweenInfo,
                            const PairColumnText(
                                title1: 'Start Time',
                                title2: 'End Time',
                                subTitle1: '03/12 15:30 ET',
                                subTitle2: '03/26 15:30 ET'),
                          ],
                        ),
                        title: 'Free Botstock Trade Summary',
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AskLoraColors.lightGreen),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 13),
                        child: Row(
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
                      )
                    ],
                  ),
                  bottomButton: Builder(
                      builder: (context) => Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 30),
                            child: PrimaryButton(
                              label: 'CONFIRM',
                              onTap: () => context
                                  .read<BotStockBloc>()
                                  .add(GetFreeBotStock(recommendedBot)),
                            ),
                          ))),
            )
          ],
        )),
      ),
    );
  }

  static void open(
          {required BuildContext context,
          required RecommendedBot recommendedBot}) =>
      Navigator.pushNamed(context, route, arguments: recommendedBot);
}
