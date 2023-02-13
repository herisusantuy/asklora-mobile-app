import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../tabs/tabs_screen.dart';
import '../../bloc/bot_stock_bloc.dart';
import '../../repository/bot_stock_repository.dart';
import '../widgets/bot_bottom_sheet_widget.dart';
import '../widgets/bot_stock_form.dart';
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
            context.read<AppBloc>().add(
                  const SaveUserJourney(UserJourney.deposit),
                );
            TabsScreen.openAndRemoveAllRoute(context,
                initialTabScreenPage: TabScreenPage.portfolio);
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: (context),
                builder: (context) => BotBottomSheetWidget(
                      title:
                          'Your free Botstock has been added to your portfolio successfully!',
                      primaryButtonLabel: 'DEPOSIT TO START REAL TRADE',
                      secondaryButtonLabel: 'NOT NOW',
                      onPrimaryButtonTap: () =>
                          DepositWelcomeScreen.open(context: context),
                      onSecondaryButtonTap: () => Navigator.pop(context),
                    ));
          }
        },
        child: BotStockForm(
            useHeader: true,
            title: recommendedBot.tickerName,
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
                  title: recommendedBot.freeBot
                      ? 'Free Botstock Trade Summary'
                      : 'Trade Summary',
                ),
                const SizedBox(
                  height: 19,
                ),
                RoundColoredBox(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
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
                        onTap: () => context
                            .read<BotStockBloc>()
                            .add(GetFreeBotStock(recommendedBot)),
                      ),
                    ))),
      ),
    );
  }

  static void open(
          {required BuildContext context,
          required RecommendedBot recommendedBot}) =>
      Navigator.pushNamed(context, route, arguments: recommendedBot);
}
