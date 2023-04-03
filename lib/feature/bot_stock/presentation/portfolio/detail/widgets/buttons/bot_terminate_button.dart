part of '../../bot_portfolio_detail_screen.dart';

class BotTerminateButton extends StatelessWidget {
  final BotType botType;
  final BotActiveOrderDetailModel botActiveOrderDetailModel;

  const BotTerminateButton(
      {required this.botActiveOrderDetailModel,
      required this.botType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<PortfolioBloc, PortfolioState>(
        listenWhen: (previous, current) =>
            previous.endBotStockResponse.state !=
            current.endBotStockResponse.state,
        listener: (context, state) {
          CustomLoadingOverlay.of(context)
              .show(state.endBotStockResponse.state);
          if (state.endBotStockResponse.state == ResponseState.success) {
            BotStockResultScreen.open(
                context: context,
                arguments: Pair('Trade Request Received',
                    '${botType.name} ${botActiveOrderDetailModel.tickerDetail.ticker} will end at 17/3/2023 10.22'));
          } else if (state.endBotStockResponse.state == ResponseState.error) {
            CustomInAppNotification.show(
                context, state.endBotStockResponse.message);
          }
        },
        child: PrimaryButton(
          buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
          label: 'END BOTSTOCK',
          onTap: () => BotStockBottomSheet.endBotStockConfirmation(
              context,
              botActiveOrderDetailModel.pk,
              botActiveOrderDetailModel.botDetail.botName,
              botActiveOrderDetailModel.tickerDetail.ticker),
        ),
      );
}
