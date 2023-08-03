part of '../tab_screen.dart';

class Tabs extends StatelessWidget {
  final BackgroundImageType backgroundImageType;
  final bool canTrade;

  const Tabs(
      {required this.canTrade, required this.backgroundImageType, super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => !isKeyboardVisible
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BlocBuilder<TabScreenBloc, TabScreenState>(
                  builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (!canTrade)
                      _tabSvg(
                          onTap: () => context
                              .read<TabScreenBloc>()
                              .add(const TabChanged(TabPage.home)),
                          iconAsset: 'bottom_nav_home',
                          activeIconAsset: 'bottom_nav_home_selected',
                          active: state.currentTabPage == TabPage.home),
                    _tabPng(
                        onTap: () => context
                            .read<TabScreenBloc>()
                            .add(const TabChanged(TabPage.forYou)),
                        iconAsset: 'bottom_nav_isq',
                        activeIconAsset: 'bottom_nav_isq_selected',
                        filledColor: backgroundImageType.tabForYouFilledColor,
                        active: state.currentTabPage == TabPage.forYou &&
                            !state.aiPageSelected),
                    if (canTrade)
                      _tabSvg(
                          onTap: () {
                            if (state.currentTabPage != TabPage.aiLandingPage) {
                              context
                                  .read<TabScreenBloc>()
                                  .add(const OnAiOverlayClick());
                            }
                          },
                          iconAsset: 'bottom_nav_asklora_ai',
                          filledColor: backgroundImageType.tabAiFilledColor,
                          activeIconAsset: backgroundImageType.tabAiActiveAsset,
                          active: state.aiPageSelected ||
                              state.currentTabPage == TabPage.aiLandingPage),
                    _tabSvg(
                        onTap: () => context
                            .read<TabScreenBloc>()
                            .add(const TabChanged(TabPage.portfolio)),
                        iconAsset: 'bottom_nav_portfolio',
                        activeIconAsset: 'bottom_nav_portfolio_selected',
                        filledColor:
                            backgroundImageType.tabPortfolioFilledColor,
                        active: state.currentTabPage == TabPage.portfolio &&
                            !state.aiPageSelected)
                  ],
                );
              }),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _tabSvg(
          {required VoidCallback onTap,
          required String iconAsset,
          String? activeIconAsset,
          Color? activeFilledColor,
          Color? filledColor,
          bool active = false,
          double clickAreaSize = 40}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          width: clickAreaSize,
          height: clickAreaSize,
          child: getSvgIcon(active ? activeIconAsset ?? iconAsset : iconAsset,
              color: active ? activeFilledColor : filledColor,
              fit: BoxFit.none),
        ),
      );

  Widget _tabPng(
          {required VoidCallback onTap,
          required String iconAsset,
          required String activeIconAsset,
          Color? filledColor,
          bool active = false,
          double clickAreaSize = 40}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          width: clickAreaSize,
          height: clickAreaSize,
          child: getPngIcon(active ? activeIconAsset : iconAsset,
              fit: BoxFit.none, color: filledColor),
        ),
      );
}
