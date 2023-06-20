part of '../tab_screen.dart';

class TabPages extends StatelessWidget {
  const TabPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TabScreenBloc, TabScreenState>(
        buildWhen: (previous, current) =>
            previous.currentTabPage != current.currentTabPage,
        builder: (context, state) {
          switch (state.currentTabPage) {
            case TabPage.home:
              return _navigatorPage(HomeScreenForm.route);
            case TabPage.forYou:
              return _navigatorPage(ForYouScreenForm.route);
            case TabPage.portfolio:
              return _navigatorPage(PortfolioScreen.route, arguments: context);
          }
        },
      ),
    );
  }

  Widget _navigatorPage(String route, {dynamic arguments}) => Navigator(
        key: Key(route),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: route,
      );
}
