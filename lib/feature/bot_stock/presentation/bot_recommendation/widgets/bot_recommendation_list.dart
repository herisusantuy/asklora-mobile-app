part of '../bot_recommendation_screen.dart';

class BotRecommendationList extends StatelessWidget {
  final double _spacing = 16;
  final double botCardHeight = 165;
  final double blurPadding;
  final double verticalMargin;

  const BotRecommendationList({required this.verticalMargin, Key? key})
      : blurPadding = verticalMargin - 8,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BotStockBloc, BotStockState>(
        buildWhen: (previous, current) =>
            previous.botRecommendationResponse.state !=
            current.botRecommendationResponse.state,
        builder: (context, state) {
          if (state.botRecommendationResponse.state == ResponseState.success) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: verticalMargin),
              padding: AppValues.screenHorizontalPadding,
              child: Wrap(
                spacing: _spacing,
                runSpacing: _spacing,
                children: state.botRecommendationResponse.data!.map((e) {
                  print('free ${e.freeBot}');
                  return BotRecommendationCard(
                    onTap: () => BotRecommendationDetailScreen.open(
                        context: context, botRecommendationModel: e),
                    height: botCardHeight,
                    spacing: _spacing,
                    botRecommendationModel: e,
                  );
                }).toList(),
              ),
            );
          } else if (state.botRecommendationResponse.state ==
              ResponseState.loading) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: verticalMargin),
              padding: AppValues.screenHorizontalPadding,
              child: Wrap(
                spacing: _spacing,
                runSpacing: _spacing,
                children: defaultBotRecommendation
                    .map((e) => BotRecommendationCardShimmer(
                          height: botCardHeight,
                          spacing: _spacing,
                        ))
                    .toList(),
              ),
            );
          } else {
            return SizedBox(
              height: _getListHeight,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: blurPadding),
                    padding: AppValues.screenHorizontalPadding
                        .copyWith(top: blurPadding, bottom: blurPadding),
                    child: Wrap(
                      spacing: _spacing,
                      runSpacing: _spacing,
                      children: defaultBotRecommendation
                          .map((e) => BotRecommendationCard(
                                onTap: () {},
                                height: botCardHeight,
                                botRecommendationModel: e,
                                spacing: _spacing,
                              ))
                          .toList(),
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: AppValues.screenHorizontalPadding,
                      child: LoraPopUpMessage(
                        backgroundColor: AskLoraColors.charcoal,
                        title: 'No Botstock recommendation.',
                        titleColor: AskLoraColors.white,
                        subTitle:
                            'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
                        subTitleColor: AskLoraColors.white,
                        buttonLabel: 'CREATE AN ACCOUNT',
                        buttonPrimaryType: ButtonPrimaryType.solidGreen,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        });
  }

  double get _getListHeight =>
      botCardHeight * defaultBotRecommendation.length / 2 +
      _spacing * ((defaultBotRecommendation.length / 2).ceil() - 1) +
      2 * blurPadding;
}
