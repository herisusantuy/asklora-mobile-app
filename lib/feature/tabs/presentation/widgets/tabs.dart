part of '../tab_screen.dart';

class Tabs extends StatelessWidget {
  final bool canTrade;

  const Tabs({required this.canTrade, super.key});

  // late final TabPage currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: BlocConsumer<TabScreenBloc, TabScreenState>(
          listenWhen: (_, current) => current.aiPageSelected,
          listener: (context, state) => openAiBottomSheet(context),
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
                    iconAsset: 'bottom_nav_for_you',
                    activeIconAsset: 'bottom_nav_for_you_selected',
                    active: state.currentTabPage == TabPage.forYou &&
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
                    activeIconAsset: 'bottom_nav_portfolio_selected',
                    active: state.currentTabPage == TabPage.portfolio &&
                        !state.aiPageSelected)
              ],
            );
          }),
    );
  }

  void openAiBottomSheet(BuildContext context) {
    Future<void> model = showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        builder: (context) => const LoraGptScreen());

    model.then((value) => onAiBottomSheetClosed(context));
  }

  void onAiBottomSheetClosed(BuildContext context) {
    final lastPage = context.read<TabScreenBloc>().state.currentTabPage;
    context.read<TabScreenBloc>().add(TabChanged(lastPage));
  }

  Widget _tabSvg(
          {required VoidCallback onTap,
          required String iconAsset,
          required String activeIconAsset,
          bool active = false,
          double size = 28}) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: size,
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
          double size = 28}) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: getPngIcon(active ? activeIconAsset : iconAsset,
              height: size, width: size, fit: BoxFit.contain),
        ),
      );
}
