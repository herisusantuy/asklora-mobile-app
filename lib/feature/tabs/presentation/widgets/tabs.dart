part of '../tab_screen.dart';

class Tabs extends StatelessWidget {
  final bool canTrade;

  const Tabs({required this.canTrade, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child:
          BlocBuilder<TabScreenBloc, TabScreenState>(builder: (context, state) {
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
                iconAsset: 'bottom_nav_for_you',
                activeIconAsset: 'bottom_nav_for_you_selected',
                active: state.currentTabPage == TabPage.forYou &&
                    !state.aiPageSelected),
            if (canTrade)
              CustomShowcaseView(
                tutorialKey: TutorialJourney.chatLoraTab,
                onToolTipClick: () {
                  ShowCaseWidget.of(context).next();
                  context.read<TabScreenBloc>().add(const AiButtonSelected());
                },
                tooltipPosition: TooltipPosition.top,
                targetBorderRadius: BorderRadius.circular(35),
                tooltipWidget: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: S.of(context).ifYouveGot,
                          style: AskLoraTextStyles.body1),
                      TextSpan(
                          text: S.of(context).anyQuestion,
                          style: AskLoraTextStyles.subtitle2),
                      TextSpan(
                          text: S.of(context).aboutYourInvestment,
                          style: AskLoraTextStyles.body1),
                      TextSpan(
                          text: S.of(context).personalAIAssistant,
                          style: AskLoraTextStyles.subtitle2),
                    ],
                  ),
                ),
                child: _tabPng(
                    onTap: () => context
                        .read<TabScreenBloc>()
                        .add(const AiButtonSelected()),
                    iconAsset: 'bottom_nav_ai',
                    activeIconAsset: 'bottom_nav_ai_selected',
                    active: state.aiPageSelected),
              ),
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
    );
  }

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
          color: AskLoraColors.white,
          width: clickAreaSize,
          height: clickAreaSize,
          child: getSvgIcon(
            active ? activeIconAsset : iconAsset,
            height: size,
          ),
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
          color: AskLoraColors.white,
          width: clickAreaSize,
          height: clickAreaSize,
          child: getPngIcon(active ? activeIconAsset : iconAsset,
              height: size, width: size),
        ),
      );
}
