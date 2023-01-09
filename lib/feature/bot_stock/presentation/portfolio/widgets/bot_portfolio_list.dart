part of '../portfolio_screen.dart';

class BotPortfolioList extends StatelessWidget {
  final double _spacing = 16;
  final double _runSpacing = 8;
  final double botCardHeight = 192;

  const BotPortfolioList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BotStockBloc, BotStockState>(
          buildWhen: (previous, current) =>
              previous.botPortfolioResponse.state !=
              current.botPortfolioResponse.state,
          builder: (context, state) {
            if (state.botPortfolioResponse.state == ResponseState.error) {
              return const LoraPopUpMessage(
                backgroundColor: AskLoraColors.charcoal,
                title: 'No traded Botstocks.',
                titleColor: AskLoraColors.white,
                subTitle:
                    'You can manage all your investments here after you start trading. Create an account and start trading.',
                subTitleColor: AskLoraColors.white,
                buttonLabel: 'CREATE AN ACCOUNT',
                buttonPrimaryType: ButtonPrimaryType.solidGreen,
              );
            } else {
              return Wrap(
                spacing: _spacing,
                runSpacing: _runSpacing,
                children: defaultRecommendedBots
                    .map((e) => state.botPortfolioResponse.state !=
                            ResponseState.success
                        ? BotPortfolioCardShimmer(
                            height: botCardHeight,
                            spacing: _spacing,
                          )
                        : BotPortfolioCard(
                            height: botCardHeight,
                            spacing: _spacing,
                            recommendedBot: e,
                          ))
                    .toList(),
              );
            }
          });
}
