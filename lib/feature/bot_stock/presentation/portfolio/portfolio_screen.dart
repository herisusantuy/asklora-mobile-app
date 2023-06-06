import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../../../../core/domain/pair.dart';
import '../../../../../../core/presentation/buttons/others/funding_button.dart';
import '../../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/presentation/custom_checkbox.dart';
import '../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../../core/presentation/shimmer.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/currency_enum.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../generated/l10n.dart';
import '../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../balance/deposit/utils/deposit_utils.dart';
import '../../../balance/withdrawal/presentation/withdrawal_bank_detail_screen.dart';
import '../../../settings/bloc/account_information/account_information_bloc.dart';
import '../../domain/orders/bot_active_order_model.dart';
import '../../repository/bot_stock_repository.dart';
import '../../utils/bot_stock_utils.dart';
import '../widgets/currency_dropdown.dart';
import '../widgets/pair_column_text.dart';
import 'bloc/portfolio_bloc.dart';
import 'detail/bot_portfolio_detail_screen.dart';
import 'domain/portfolio_response.dart';
import 'repository/portfolio_repository.dart';
import 'utils/portfolio_utils.dart';
import 'widgets/bot_portfolio_pop_up.dart';

part 'widgets/bot_portfolio_card.dart';

part 'widgets/bot_portfolio_card_shimmer.dart';

part 'widgets/bot_portfolio_list.dart';

part 'widgets/bot_portfolio_filter.dart';

part 'widgets/free_bot_badge.dart';

part 'widgets/portfolio_balance.dart';

class PortfolioScreen extends StatelessWidget {
  static const String route = '/portfolio_screen';

  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        PortfolioBloc portfolioBloc = PortfolioBloc(
            portfolioRepository: PortfolioRepository(),
            botStockRepository: BotStockRepository());

        ///fetch portfolio when current UserJourney already passed freeBotStock
        if (UserJourney.compareUserJourney(
            context: context, target: UserJourney.freeBotStock)) {
          portfolioBloc.add(const FetchActiveOrders());
          portfolioBloc.add(FetchPortfolio());
        }
        return portfolioBloc;
      },
      child: CustomScaffold(
        useSafeArea: false,
        backgroundColor: AskLoraColors.white,
        enableBackNavigation: false,
        body: BlocBuilder<PortfolioBloc, PortfolioState>(
          buildWhen: (previous, current) =>
              previous.portfolioResponse != current.portfolioResponse ||
              previous.botActiveOrderResponse !=
                  current.botActiveOrderResponse ||
              previous.currency != current.currency,
          builder: (context, state) => RefreshIndicator(
            onRefresh: () async {
              ///fetch portfolio when current UserJourney already passed freeBotStock
              if (UserJourney.compareUserJourney(
                  context: context, target: UserJourney.freeBotStock)) {
                context.read<PortfolioBloc>().add(const FetchActiveOrders());
                context.read<PortfolioBloc>().add(FetchPortfolio());
              }
              context
                  .read<AccountInformationBloc>()
                  .add(GetAccountInformation());
            },
            child: CustomLayoutWithBlurPopUp(
              loraPopUpMessageModel: LoraPopUpMessageModel(
                title: S.of(context).errorGettingInformationTitle,
                subTitle:
                    S.of(context).errorGettingInformationPortfolioSubTitle,
                primaryButtonLabel: S.of(context).buttonReloadPage,
                onPrimaryButtonTap: () {
                  context.read<PortfolioBloc>().add(const FetchActiveOrders());
                  context.read<PortfolioBloc>().add(FetchPortfolio());
                },
              ),
              showPopUp:
                  (state.botActiveOrderResponse.state == ResponseState.error &&
                          state.botActiveOrderResponse.errorCode != 403) ||
                      state.portfolioResponse.state == ResponseState.error,
              content: ListView(
                padding: AppValues.screenHorizontalPadding
                    .copyWith(top: 15, bottom: 15),
                children: [
                  PortfolioBalance(
                    data: state.portfolioResponse.data,
                    currencyType: state.currency,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BotPortfolioList(
                    userJourney: context.read<AppBloc>().state.userJourney,
                    portfolioState: state,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
