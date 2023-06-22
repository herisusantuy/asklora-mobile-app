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
import '../../tabs/bloc/tab_screen_bloc.dart';
import '../../tabs/for_you/bloc/for_you_bloc.dart';
import '../../tabs/for_you/for_you_screen_form.dart';
import '../../tabs/for_you/investment_style/bloc/for_you_question_bloc.dart';
import '../../tabs/for_you/repository/for_you_repository.dart';
import '../../tabs/home/home_screen_form.dart';
import 'widgets/ai_overlay.dart';

part 'widgets/tab_pages.dart';

part 'widgets/tabs.dart';

class TabScreen extends StatelessWidget {
  static const String route = '/custom_tab_screen';
  final TabPage? initialTabPage;

  const TabScreen({this.initialTabPage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
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
            builder: (context, state) => CustomLayoutWithBlurPopUp(
              showPopUp: state.response.state == ResponseState.error,
              content: state.response.data != null
                  ? BlocProvider(
                      create: (_) => TabScreenBloc(
                          initialTabPage: state.response.data!.canTrade
                              ? TabPage.forYou
                              : TabPage.home),
                      child: BlocListener<TabScreenBloc, TabScreenState>(
                        listenWhen: (previous, current) =>
                            previous.tabScreenBackState !=
                            current.tabScreenBackState,
                        listener: (context, state) {
                          if (state.tabScreenBackState ==
                              TabScreenBackState.openConfirmation) {
                            CustomInAppNotification.show(
                                context, 'Please click BACK again to exit');
                          } else if (state.tabScreenBackState ==
                              TabScreenBackState.closeApp) {
                            Navigator.pop(context);
                          }
                        },
                        child: Builder(
                          builder: (context) => WillPopScope(
                            onWillPop: () async {
                              context
                                  .read<TabScreenBloc>()
                                  .add(BackButtonClicked());
                              return false;
                            },
                            child: Column(
                              children: [
                                TabPages(
                                    canTrade: state.response.data!.canTrade),
                                const Tabs(canTrade: true)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),

              ///TODO : IMPLEMENT THE RIGHT COPYWRITING LATER
              loraPopUpMessageModel: LoraPopUpMessageModel(
                  title: S.of(context).errorGettingInformationTitle,
                  subTitle:
                      S.of(context).errorGettingInformationPortfolioSubTitle,
                  primaryButtonLabel: S.of(context).buttonReloadPage,
                  onPrimaryButtonTap: () => context
                      .read<AccountInformationBloc>()
                      .add(GetAccountInformation())),
            ),
          ),
        ),
      );

  static void openAndRemoveAllRoute(BuildContext context,
          {TabPage? initialTabPage}) =>
      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
          route, (Route<dynamic> route) => false,
          arguments: initialTabPage);
}
