part of '../portfolio_screen.dart';

class BotPortfolioList extends StatelessWidget {
  final double _spacing = 16;
  final double _runSpacing = 8;
  final double botCardHeight = 192;
  final UserJourney userJourney;
  final PortfolioState portfolioState;

  const BotPortfolioList(
      {required this.userJourney, required this.portfolioState, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userJourney == UserJourney.investmentStyle) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.investmentStyle);
    } else if (userJourney == UserJourney.kyc) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.kyc);
    } else if (userJourney == UserJourney.freeBotStock) {
      return const BotPortfolioPopUp(
          botPortfolioPopUpType: BotPortfolioPopUpType.redeemBotStock);
    } else {
      if (portfolioState.botActiveOrderResponse.state ==
          ResponseState.success) {
        if (portfolioState.botActiveOrderResponse.data!.isNotEmpty) {
          return Column(
            children: [
              const BotPortfolioFilter(),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: _spacing,
                  runSpacing: _runSpacing,
                  children: portfolioState.botActiveOrderResponse.data!
                      .map((e) => BotPortfolioCard(
                            height: botCardHeight,
                            spacing: _spacing,
                            botActiveOrderModel: e,
                          ))
                      .toList(),
                ),
              ),
            ],
          );
        } else {
          if (portfolioState.botStockFilter == BotStockFilter.all) {
            return const BotPortfolioPopUp(
                botPortfolioPopUpType: BotPortfolioPopUpType.noBotStock);
          } else {
            return Column(
              children: [
                const BotPortfolioFilter(),
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height - 600) / 2),
                  child: CustomTextNew(
                    'No ${portfolioState.botStockFilter.name} Botstocks',
                    style: AskLoraTextStyles.body1
                        .copyWith(color: AskLoraColors.darkGray),
                  ),
                ),
              ],
            );
          }
        }
      } else if (portfolioState.botActiveOrderResponse.state ==
          ResponseState.loading) {
        return Wrap(
          spacing: _spacing,
          runSpacing: _runSpacing,
          children: defaultBotRecommendation
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
    }
  }
}
