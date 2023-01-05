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
              return LoraPopUpMessage(
                backgroundColor: AskLoraColors.charcoal,
                children: [
                  CustomTextNew(
                    'No traded Botstocks.',
                    style: AskLoraTextStyles.h4
                        .copyWith(color: AskLoraColors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextNew(
                    'You can manage all your investments here after you start trading. Create an account and start trading.',
                    style: AskLoraTextStyles.body2
                        .copyWith(color: AskLoraColors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryButton(
                      buttonPrimaryType: ButtonPrimaryType.solidGreen,
                      label: 'CREATE AN ACCOUNT',
                      onTap: () {})
                ],
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
