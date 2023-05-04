import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/presentation/custom_scaffold.dart';
import '../../core/utils/app_icons.dart';
import '../bot_stock/presentation/portfolio/portfolio_screen.dart';
import 'bloc/tabs_screen_bloc.dart';
import 'for_you/for_you_screen_form.dart';
import 'home/home_screen_form.dart';
import 'lora_gpt/presentation/lora_gpt_screen.dart';

enum TabScreenPage { home, forYou, portfolio, loraGpt }

class TabsScreen extends StatelessWidget {
  static const String route = '/tab_screen';
  final TabScreenPage? initialTabScreenPage;

  const TabsScreen({
    Key? key,
    this.initialTabScreenPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabScreenBloc()..add(const TabIndexChanged(0)),
      child: CustomScaffold(
          enableBackNavigation: false,
          bottomNavigationBar: BlocBuilder<TabScreenBloc, TabScreenState>(
            buildWhen: (previous, current) =>
                previous.currentIndexScreen != current.currentIndexScreen,
            builder: (context, state) {
              return BottomNavigationBar(
                selectedFontSize: 0,
                type: BottomNavigationBarType.fixed,
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
                  ),
                  BottomNavigationBarItem(
                    icon: getSvgIcon('bottom_nav_stock_gpt'),
                    label: '',
                    activeIcon: getSvgIcon('bottom_nav_stock_gpt_selected'),
                  )
                ],
                currentIndex: state.currentIndexScreen,
                selectedItemColor: Colors.amber[800],
                onTap: (int index) =>
                    context.read<TabScreenBloc>().add(TabIndexChanged(index)),
              );
            },
          ),
          body: BlocBuilder<TabScreenBloc, TabScreenState>(
            buildWhen: (previous, current) =>
                previous.currentIndexScreen != current.currentIndexScreen,
            builder: (context, state) {
              return IndexedStack(
                  index: state.currentIndexScreen, children: _widgets);
            },
          )),
    );
  }

  static const List<Widget> _widgets = <Widget>[
    HomeScreenForm(),
    ForYouScreenForm(),
    PortfolioScreen(),
    LoraGptScreen()
  ];

  static void openAndRemoveAllRoute(BuildContext context,
          {TabScreenPage? initialTabScreenPage}) =>
      Navigator.of(context).pushNamedAndRemoveUntil(
          route, (Route<dynamic> route) => false,
          arguments: initialTabScreenPage);
}
