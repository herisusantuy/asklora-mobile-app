import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/presentation/custom_in_app_notification.dart';
import '../../core/presentation/custom_scaffold.dart';
import '../../core/utils/app_icons.dart';
import '../bot_stock/presentation/portfolio/portfolio_screen.dart';
import '../onboarding/kyc/repository/account_repository.dart';
import '../settings/bloc/account_information/account_information_bloc.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TabScreenBloc()
              ..add(TabIndexChanged(initialTabScreenPage == null
                  ? 0
                  : initialTabScreenPage!.index)),
          ),
          BlocProvider(
            create: (_) =>
                AccountInformationBloc(accountRepository: AccountRepository())
                  ..add(GetAccountInformation()),
          ),
        ],
        child: BlocConsumer<TabScreenBloc, TabScreenState>(
          listenWhen: (previous, current) =>
              previous.isShowConfirmationBack != current.isShowConfirmationBack,
          listener: (context, state) {
            if (state.isShowConfirmationBack) {
              return CustomInAppNotification.show(
                  context, 'Please click BACK again to exit');
            }
          },
          buildWhen: (previous, current) =>
              previous.currentIndexScreen != current.currentIndexScreen ||
              previous.isShowConfirmationBack != current.isShowConfirmationBack,
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () async {
                context.read<TabScreenBloc>().add(BackButtonClickedOnce());
                if (state.isShowConfirmationBack) {
                  return true;
                }
                return false;
              },
              child: CustomScaffold(
                  enableBackNavigation: false,
                  bottomNavigationBar: BottomNavigationBar(
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
                    onTap: (int index) => context
                        .read<TabScreenBloc>()
                        .add(TabIndexChanged(index)),
                  ),
                  body: BlocBuilder<TabScreenBloc, TabScreenState>(
                    buildWhen: (previous, current) =>
                        previous.currentIndexScreen !=
                        current.currentIndexScreen,
                    builder: (context, state) {
                      return IndexedStack(
                          index: state.currentIndexScreen, children: _widgets);
                    },
                  )),
            );
          },
        ));
  }

  static final List<Widget> _widgets = <Widget>[
    const HomeScreenForm(),
    const ForYouScreenForm(),
    const PortfolioScreen(),
    const LoraGptScreen()
  ];

  static void openAndRemoveAllRoute(BuildContext context,
          {TabScreenPage? initialTabScreenPage}) =>
      Navigator.of(context).pushNamedAndRemoveUntil(
          route, (Route<dynamic> route) => false,
          arguments: initialTabScreenPage);
}
