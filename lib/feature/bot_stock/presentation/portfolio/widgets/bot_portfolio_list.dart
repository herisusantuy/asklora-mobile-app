part of '../portfolio_screen.dart';

class BotPortfolioList extends StatelessWidget {
  final double _spacing = 16;
  final double _runSpacing = 8;
  final double botCardHeight = 192;
  final UserJourney userJourney;

  const BotPortfolioList({required this.userJourney, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userJourney == UserJourney.personalisation) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.personalisation);
    } else if (userJourney == UserJourney.createAccount) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.createAccount);
    } else if (userJourney == UserJourney.investmentStyle) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.investmentStyle);
    } else if (userJourney == UserJourney.kyc) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.kyc);
    } else if (userJourney == UserJourney.freeBotStock) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.redeemBotStock);
    } else {
      return BlocBuilder<PortfolioBloc, PortfolioState>(
          buildWhen: (previous, current) =>
              previous.botPortfolioResponse.state !=
              current.botPortfolioResponse.state,
          builder: (context, state) {
            if (state.botPortfolioResponse.state == ResponseState.success) {
              if (state.botPortfolioResponse.data!.isNotEmpty) {
                return Column(
                  children: [
                    const BotPortfolioFilter(),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: _spacing,
                        runSpacing: _runSpacing,
                        children: state.botPortfolioResponse.data!
                            .map((e) => BotPortfolioCard(
                                  height: botCardHeight,
                                  spacing: _spacing,
                                  recommendedBot: e,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                );
              } else {
                if (state.botStockFilter == BotStockFilter.all) {
                  return const BotPortfolioPopUp(
                      botPortfolioPopUpType: BotPortfolioPopUpType.noBotStock);
                } else {
                  return Column(
                    children: [
                      const BotPortfolioFilter(),
                      Padding(
                        padding: EdgeInsets.only(
                            top:
                                (MediaQuery.of(context).size.height - 600) / 2),
                        child: CustomTextNew(
                          'No ${state.botStockFilter.name} Botstocks',
                          style: AskLoraTextStyles.body1
                              .copyWith(color: AskLoraColors.darkGray),
                        ),
                      ),
                    ],
                  );
                }
              }
            } else if (state.botPortfolioResponse.state ==
                ResponseState.loading) {
              return Wrap(
                spacing: _spacing,
                runSpacing: _runSpacing,
                children: defaultRecommendedBots
                    .map(
                      (e) => BotPortfolioCardShimmer(
                        height: botCardHeight,
                        spacing: _spacing,
                      ),
                    )
                    .toList(),
              );
            } else {
              return const SizedBox();
            }
          });
    }
  }
}
