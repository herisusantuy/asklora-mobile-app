import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../../core/domain/base_response.dart';
import '../../../core/presentation/custom_in_app_notification.dart';
import '../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../core/repository/transaction_repository.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/route_generator.dart';
import '../../../core/utils/storage/cache/json_cache_shared_preferences.dart';
import '../../../core/utils/storage/shared_preference.dart';
import '../../../generated/l10n.dart';
import '../../bot_stock/bloc/bot_stock_bloc.dart';
import '../../bot_stock/presentation/portfolio/bloc/portfolio_bloc.dart';
import '../../bot_stock/presentation/portfolio/portfolio_screen.dart';
import '../../bot_stock/repository/bot_stock_repository.dart';
import '../../onboarding/kyc/repository/account_repository.dart';
import '../../onboarding/ppi/bloc/response/user_response_bloc.dart';
import '../../onboarding/ppi/repository/ppi_question_repository.dart';
import '../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../../settings/bloc/account_information/account_information_bloc.dart';
import '../../tabs/for_you/bloc/for_you_bloc.dart';
import '../../tabs/for_you/for_you_screen_form.dart';
import '../../tabs/for_you/investment_style/bloc/for_you_question_bloc.dart';
import '../../tabs/for_you/repository/for_you_repository.dart';
import '../../tabs/home/home_screen_form.dart';
import '../bloc/custom_tab_bloc.dart';

class CustomTab extends StatelessWidget {
  static const String route = '/custom_tab_screen';
  final TabPage? initialTabPage;

  const CustomTab({this.initialTabPage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              AccountInformationBloc(accountRepository: AccountRepository())
                ..add(GetAccountInformation()),
        ),
        BlocProvider(
          create: (_) {
            PortfolioBloc portfolioBloc = PortfolioBloc(
              botStockRepository: BotStockRepository(),
              transactionHistoryRepository: TransactionRepository(),
            );

            ///fetch portfolio when current UserJourney already passed freeBotStock
            if (UserJourney.compareUserJourney(
                context: context, target: UserJourney.freeBotStock)) {
              portfolioBloc.add(const FetchActiveOrders());
              portfolioBloc.add(FetchBalance());
            }
            return portfolioBloc;
          },
        ),
        BlocProvider(
          create: (_) => ForYouBloc(forYouRepository: ForYouRepository())
            ..add(GetInvestmentStyleState()),
        ),
        BlocProvider(
          create: (_) {
            BotStockBloc botStockBloc = BotStockBloc(
                botStockRepository: BotStockRepository(),
                transactionRepository: TransactionRepository());
            if (context.read<AppBloc>().state.userJourney ==
                UserJourney.freeBotStock) {
              botStockBloc.add(FetchFreeBotRecommendation());
            } else {
              botStockBloc.add(FetchBotRecommendation());
            }
            return botStockBloc;
          },
        ),
        BlocProvider(
          create: (_) => ForYouQuestionBloc(
              ppiQuestionRepository: PpiQuestionRepository(),
              sharedPreference: SharedPreference())
            ..add(LoadQuestion()),
        ),
        BlocProvider(
            create: (_) => UserResponseBloc(
                sharedPreference: SharedPreference(),
                ppiResponseRepository: PpiResponseRepository(),
                jsonCacheSharedPreferences: JsonCacheSharedPreferences())),
      ],
      child: CustomScaffold(
          enableBackNavigation: false,
          body: BlocConsumer<AccountInformationBloc, AccountInformationState>(
              listener: (context, state) =>
                  CustomLoadingOverlay(context).show(state.response.state),
              buildWhen: (previous, current) =>
                  previous.response.data != current.response.data ||
                  current.response.state == ResponseState.error,
              builder: (context, state) {
                return CustomLayoutWithBlurPopUp(
                  showPopUp: state.response.state == ResponseState.error,
                  content: state.response.data != null
                      ? BlocProvider(
                          create: (_) => CustomTabBloc(
                              initialTabPage: state.response.data!.canTrade
                                  ? TabPage.forYou
                                  : TabPage.home),
                          child: Column(
                            children: [
                              _pages,
                              _tabs(state.response.data!.canTrade)
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),

                  ///TODO : IMPLEMENT THE RIGHT COPYWRITING LATER
                  loraPopUpMessageModel: LoraPopUpMessageModel(
                      title: S.of(context).errorGettingInformationTitle,
                      subTitle: S
                          .of(context)
                          .errorGettingInformationPortfolioSubTitle,
                      primaryButtonLabel: S.of(context).buttonReloadPage,
                      onPrimaryButtonTap: () => context
                          .read<AccountInformationBloc>()
                          .add(GetAccountInformation())),
                );
              })),
    );
  }

  Widget _tabs(bool canTrade) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: BlocConsumer<CustomTabBloc, CustomTabState>(
          listenWhen: (_, current) => current.aiPageSelected,
          listener: (context, state) => CustomInAppNotification.show(
              context, 'this should open overlay AI'),
          builder: (context, state) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (!canTrade)
                _tabSvg(
                    onTap: () => context
                        .read<CustomTabBloc>()
                        .add(const TabChanged(TabPage.home)),
                    iconAsset: 'bottom_nav_home',
                    activeIconAsset: 'bottom_nav_home_selected',
                    active: state.currentTabPage == TabPage.home),
              _tabSvg(
                  onTap: () => context
                      .read<CustomTabBloc>()
                      .add(const TabChanged(TabPage.forYou)),
                  iconAsset: 'bottom_nav_for_you',
                  activeIconAsset: 'bottom_nav_for_you_selected',
                  active: state.currentTabPage == TabPage.forYou &&
                      !state.aiPageSelected),
              if (canTrade)
                _tabPng(
                    onTap: () => context
                        .read<CustomTabBloc>()
                        .add(const AiButtonSelected()),
                    iconAsset: 'bottom_nav_ai',
                    activeIconAsset: 'bottom_nav_ai_selected',
                    active: state.aiPageSelected),
              _tabSvg(
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

  Widget get _pages => Expanded(
        child: BlocBuilder<CustomTabBloc, CustomTabState>(
          buildWhen: (previous, current) =>
              previous.currentTabPage != current.currentTabPage,
          builder: (context, state) {
            switch (state.currentTabPage) {
              case TabPage.home:
                return _navigatorPage(HomeScreenForm.route);
              case TabPage.forYou:
                return _navigatorPage(ForYouScreenForm.route);
              case TabPage.portfolio:
                return _navigatorPage(PortfolioScreen.route,
                    arguments: context);
            }
          },
        ),
      );

  Widget _navigatorPage(String route, {dynamic arguments}) => Navigator(
        key: Key(route),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: route,
      );

  Widget _tabSvg(
          {required VoidCallback onTap,
          required String iconAsset,
          required String activeIconAsset,
          bool active = false,
          double size = 38}) =>
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
          double size = 38}) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: getPngIcon(active ? activeIconAsset : iconAsset,
              height: size, width: size, fit: BoxFit.contain),
        ),
      );

  static void openAndRemoveAllRoute(BuildContext context,
          {TabPage? initialTabPage}) =>
      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
          route, (Route<dynamic> route) => false,
          arguments: initialTabPage);
}
