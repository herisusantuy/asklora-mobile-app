part of '../tab_screen.dart';

class Tabs extends StatelessWidget {
  final bool canTrade;

  const Tabs({required this.canTrade, super.key});

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
                    _tabSvg(
                        onTap: () => context
                            .read<TabScreenBloc>()
                            .add(const TabChanged(TabPage.forYou)),
                        iconAsset: 'bottom_nav_isq',
                        activeIconAsset: 'bottom_nav_isq_selected',
                        active: state.currentTabPage == TabPage.forYou &&
                            !state.aiPageSelected),
                    if (canTrade)
                      _tabSvg(
                          onTap: () => context
                              .read<TabScreenBloc>()
                              .add(const OnAiOverlayClick()),
                          iconAsset: 'bottom_nav_asklora_ai',
                          activeIconAsset: 'bottom_nav_asklora_ai_selected',
                          active: state.aiPageSelected),
                    _tabSvg(
                        onTap: () => context
                            .read<TabScreenBloc>()
                            .add(const TabChanged(TabPage.portfolio)),
                        iconAsset: 'bottom_nav_portfolio',
                        activeIconAsset: 'bottom_nav_portfolio_selected',
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
          required String activeIconAsset,
          bool active = false,
          double clickAreaSize = 36}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          width: clickAreaSize,
          height: clickAreaSize,
          child: getSvgIcon(active ? activeIconAsset : iconAsset,
              fit: BoxFit.none),
        ),
      );
}
