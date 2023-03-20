import 'package:flutter/material.dart';

import '../../core/presentation/custom_scaffold.dart';
import '../../core/utils/app_icons.dart';
import '../../core/utils/log.dart';
import '../bot_stock/presentation/portfolio/portfolio_screen.dart';
import 'for_you/for_you_screen_form.dart';
import 'home/home_screen_form.dart';

enum TabScreenPage { home, forYou, portfolio }

class TabsScreen extends StatefulWidget {
  static const String route = '/tab_screen';
  final TabScreenPage? initialTabScreenPage;

  const TabsScreen({this.initialTabScreenPage, super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();

  static void openAndRemoveAllRoute(BuildContext context,
          {TabScreenPage? initialTabScreenPage}) =>
      Navigator.of(context).pushNamedAndRemoveUntil(
          route, (Route<dynamic> route) => false,
          arguments: initialTabScreenPage);
}

class _TabsScreenState extends State<TabsScreen>
    with AutomaticKeepAliveClientMixin<TabsScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgets = <Widget>[
    HomeScreenForm(),
    ForYouScreenForm(),
    PortfolioScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setInitialIndex() {
    switch (widget.initialTabScreenPage) {
      case TabScreenPage.forYou:
        _onItemTapped(1);
        break;
      case TabScreenPage.portfolio:
        _onItemTapped(2);
        break;
      default:
        _onItemTapped(0);
    }
  }

  @override
  void initState() {
    _setInitialIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Logger.log('Tab_Screen_Build');
    return CustomScaffold(
        enableBackNavigation: false,
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: getSvgIcon('bottom_nav_home'),
              activeIcon: getSvgIcon('bottom_nav_home_selected'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: getSvgIcon('bottom_nav_for_you'),
              label: '',
              activeIcon: getSvgIcon('bottom_nav_for_you_selected'),
            ),
            BottomNavigationBarItem(
              icon: getSvgIcon('bottom_nav_portfolio'),
              label: '',
              activeIcon: getSvgIcon('bottom_nav_portfolio_selected'),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: IndexedStack(index: _selectedIndex, children: _widgets));
  }

  @override
  bool get wantKeepAlive => true;
}
