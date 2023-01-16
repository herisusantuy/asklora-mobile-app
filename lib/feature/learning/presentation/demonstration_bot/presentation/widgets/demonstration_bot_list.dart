part of '../demonstration_bot_screen.dart';

class DemonstrationBotList extends StatelessWidget {
  final double _spacing = 16;
  final double botCardHeight = 165;
  final double blurPadding;
  final double verticalMargin;
  final JustTheController tooltipController;

  const DemonstrationBotList(
      {required this.verticalMargin, required this.tooltipController, Key? key})
      : blurPadding = verticalMargin - 8,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemonstrationBotBloc, DemonstrationBotState>(
        buildWhen: (previous, current) =>
            previous.botDemonstrationResponse.state !=
            current.botDemonstrationResponse.state,
        builder: (context, state) {
          if (state.botDemonstrationResponse.state == ResponseState.success) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: verticalMargin),
              child: Wrap(
                spacing: _spacing,
                runSpacing: _spacing,
                children: state.botDemonstrationResponse.data!
                    .map((e) => e.selectable
                        ? DemonstrationTooltipGuide(
                            verticalOffset: 10,
                            horizontalOffset: 110,
                            text: 'Trade this!',
                            tooltipController: tooltipController,
                            showImmediately: false,
                            child: BotRecommendationCard(
                              onTap: () => context
                                  .read<NavigationBloc<LearningPageStep>>()
                                  .add(const PageChanged(
                                      LearningPageStep.botDetail)),
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
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.symmetric(vertical: verticalMargin),
              child: Wrap(
                spacing: _spacing,
                runSpacing: _spacing,
                children: defaultRecommendedBots
                    .map((e) => BotRecommendationCardShimmer(
                          height: botCardHeight,
                          spacing: _spacing,
                        ))
                    .toList(),
              ),
            );
          }
        });
  }
}
