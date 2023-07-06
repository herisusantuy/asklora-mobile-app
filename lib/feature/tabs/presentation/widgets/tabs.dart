part of '../tab_screen.dart';

class Tabs extends StatelessWidget {
  final bool canTrade;

  const Tabs({required this.canTrade, super.key});

  @override
  Widget build(BuildContext context) => KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => !isKeyboardVisible
            ? SizedBox(
                height: tabHeight,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: Colors.white.withOpacity(0.8),
                      child: BlocBuilder<TabScreenBloc, TabScreenState>(
                        builder: (context, state) => Row(
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
                                iconAsset: 'bottom_nav_for_you',
                                activeIconAsset: 'bottom_nav_for_you_selected',
                                active:
                                    state.currentTabPage == TabPage.forYou &&
                                        !state.aiPageSelected),
                            if (canTrade)
                              _tabPng(
                                  onTap: () => context
                                      .read<TabScreenBloc>()
                                      .add(const AiButtonSelected()),
                                  iconAsset: 'bottom_nav_ai',
                                  activeIconAsset: 'bottom_nav_ai_selected',
                                  active: state.aiPageSelected),
                            _tabSvg(
                                onTap: () => context
                                    .read<TabScreenBloc>()
                                    .add(const TabChanged(TabPage.portfolio)),
                                iconAsset: 'bottom_nav_portfolio',
                                activeIconAsset:
                                    'bottom_nav_portfolio_selected',
                                active:
                                    state.currentTabPage == TabPage.portfolio &&
                                        !state.aiPageSelected)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      );

  Widget _tabSvg(
          {required VoidCallback onTap,
          required String iconAsset,
          required String activeIconAsset,
          bool active = false,
          double size = 28,
          double clickAreaSize = 40}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          width: clickAreaSize,
          height: clickAreaSize,
          child: getSvgIcon(active ? activeIconAsset : iconAsset,
              height: size, fit: BoxFit.none),
        ),
      );

  Widget _tabPng(
          {required VoidCallback onTap,
          required String iconAsset,
          required String activeIconAsset,
          bool active = false,
          double size = 28,
          double clickAreaSize = 40}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          width: clickAreaSize,
          height: clickAreaSize,
          child: getPngIcon(active ? activeIconAsset : iconAsset,
              height: size, width: size),
        ),
      );
}
