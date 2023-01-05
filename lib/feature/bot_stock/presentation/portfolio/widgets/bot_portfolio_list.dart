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
          builder: (context, state) => Wrap(
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
              ));
}
