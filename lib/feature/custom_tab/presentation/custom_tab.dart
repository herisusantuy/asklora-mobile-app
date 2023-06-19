import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/presentation/custom_in_app_notification.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/route_generator.dart';
import '../../bot_stock/presentation/portfolio/portfolio_screen.dart';
import '../../onboarding/kyc/repository/account_repository.dart';
import '../../settings/bloc/account_information/account_information_bloc.dart';
import '../../tabs/for_you/for_you_screen_form.dart';
import '../bloc/custom_tab_bloc.dart';


class CustomTab extends StatelessWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              AccountInformationBloc(accountRepository: AccountRepository())
                ..add(GetAccountInformation()),
        ),
        BlocProvider(create: (_) => CustomTabBloc()),
      ],
      child: CustomScaffold(
          enableBackNavigation: false,
          body: Column(
            children: [_getPage, _getTab],
          )),
    );
  }

  Widget get _getTab => Padding(
        padding: const EdgeInsets.fromLTRB(60, 16, 60, 10),
        child: BlocConsumer<CustomTabBloc, CustomTabState>(
          listenWhen: (_, current) => current.aiPageSelected,
          listener: (context, state) => CustomInAppNotification.show(
              context, 'this should open overlay AI'),
          builder: (context, state) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _tab(
                  onTap: () => context
                      .read<CustomTabBloc>()
                      .add(const TabChanged(TabPage.forYou)),
                  iconAsset: 'bottom_nav_for_you',
                  activeIconAsset: 'bottom_nav_for_you_selected',
                  active: state.currentTabPage == TabPage.forYou &&
                      !state.aiPageSelected),
              _tab(
                  onTap: () => context
                      .read<CustomTabBloc>()
                      .add(const AiButtonSelected()),
                  iconAsset: 'bottom_nav_stock_gpt',
                  activeIconAsset: 'bottom_nav_stock_gpt_selected',
                  active: state.aiPageSelected),
              _tab(
                  onTap: () => context
                      .read<CustomTabBloc>()
                      .add(const TabChanged(TabPage.portfolio)),
                  iconAsset: 'bottom_nav_portfolio',
                  activeIconAsset: 'bottom_nav_portfolio_selected',
                  active: state.currentTabPage == TabPage.portfolio &&
                      !state.aiPageSelected)
            ],
          ),
        ),
      );

  Widget get _getPage => Expanded(
        child: BlocBuilder<CustomTabBloc, CustomTabState>(
          buildWhen: (previous, current) =>
              previous.currentTabPage != current.currentTabPage,
          builder: (context, state) {
            switch (state.currentTabPage) {
              case TabPage.forYou:
                return _navigatorPage(ForYouScreenForm.route);
              case TabPage.portfolio:
                return _navigatorPage(PortfolioScreen.route);
            }
          },
        ),
      );

  Widget _navigatorPage(String route) => Navigator(
        key: Key(route),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: route,
      );

  Widget _tab(
          {required VoidCallback onTap,
          required String iconAsset,
          required String activeIconAsset,
          bool active = false,
          double height = 38}) =>
      GestureDetector(
        onTap: onTap,
        child: getSvgIcon(
          active ? activeIconAsset : iconAsset,
          height: height,
        ),
      );
}
