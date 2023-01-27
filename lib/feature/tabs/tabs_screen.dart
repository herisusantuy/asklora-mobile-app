import 'package:flutter/material.dart';

import '../../core/presentation/custom_scaffold.dart';
import '../../core/utils/app_icons.dart';
import 'home/home_screen_form.dart';

class TabsScreen extends StatelessWidget {
  static const String route = '/tab_screen';

  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) => const BottomTabBarWidget();

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}

class BottomTabBarWidget extends StatefulWidget {
  const BottomTabBarWidget({super.key});

  @override
  State<BottomTabBarWidget> createState() => _BottomTabsWidgetState();
}

class _BottomTabsWidgetState extends State<BottomTabBarWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreenForm(),
    Text(
      'Index 1: For you Screen',
      style: optionStyle,
    ),
    Text(
      'Index 2: Portfolio Screen',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)));
  }
}
