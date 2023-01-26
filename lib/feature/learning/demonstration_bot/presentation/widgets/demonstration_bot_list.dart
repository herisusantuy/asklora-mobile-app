part of '../demonstration_bot_screen.dart';

class DemonstrationBotList extends StatelessWidget {
  final BotType botType;
  final double _spacing = 16;
  final double botCardHeight = 165;
  final double blurPadding;
  final double verticalMargin;
  final JustTheController tooltipController;

  const DemonstrationBotList(
      {required this.verticalMargin,
      required this.tooltipController,
      required this.botType,
      Key? key})
      : blurPadding = verticalMargin - 8,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: BlocBuilder<DemonstrationBotBloc, DemonstrationBotState>(
          buildWhen: (previous, current) =>
              previous.botDemonstrationResponse.state !=
              current.botDemonstrationResponse.state,
          builder: (context, state) {
            if (state.botDemonstrationResponse.state == ResponseState.success) {
              return _listData(
                  context: context,
                  recommendedBots: state.botDemonstrationResponse.data!);
            } else {
              return _listShimmer();
            }
          }),
    );
  }

  Widget _listShimmer() => Wrap(
        spacing: _spacing,
        runSpacing: _spacing,
        children: defaultRecommendedBots
            .map((e) => BotRecommendationCardShimmer(
                  height: botCardHeight,
                  spacing: _spacing,
                ))
            .toList(),
      );

  Widget _listData(
          {required BuildContext context,
          required List<RecommendedBot> recommendedBots}) =>
      Wrap(
        spacing: _spacing,
        runSpacing: _spacing,
        children: recommendedBots
            .map((e) => e.selectable && e.botType == botType.value
                ? DemonstrationTooltipGuide(
                    verticalOffset: 10,
                    horizontalOffset: 110,
                    text: 'Trade this!',
                    tooltipController: tooltipController,
                    showImmediately: false,
                    child: BotRecommendationCard(
                      onTap: () => context
                          .read<NavigationBloc<LearningPageStep>>()
                          .add(const PageChanged(LearningPageStep.botDetail)),
                      height: botCardHeight,
                      spacing: _spacing,
                      recommendedBot: e,
                      isDisabled: false,
                    ),
                  )
                : BotRecommendationCard(
                    onTap: () {},
                    height: botCardHeight,
                    spacing: _spacing,
                    recommendedBot: e,
                    isDisabled: true,
                  ))
            .toList(),
      );
}
