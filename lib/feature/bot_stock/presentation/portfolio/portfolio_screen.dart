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
import '../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../balance/withdrawal/presentation/withdrawal_bank_detail_screen.dart';
import '../../domain/orders/bot_active_order_model.dart';
import '../../repository/bot_stock_repository.dart';
import '../../utils/bot_stock_utils.dart';
import '../widgets/currency_dropdown.dart';
import '../widgets/pair_column_text.dart';
import 'bloc/portfolio_bloc.dart';
import 'detail/bot_portfolio_detail_screen.dart';
import 'domain/portfolio_response.dart';
import 'repository/portfolio_repository.dart';
import 'utils/portfolio_enum.dart';
import 'widgets/bot_portfolio_pop_up.dart';

part 'widgets/bot_portfolio_card.dart';

part 'widgets/bot_portfolio_card_shimmer.dart';

part 'widgets/bot_portfolio_list.dart';

part 'widgets/bot_portfolio_filter.dart';

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
          builder: (context, state) => CustomLayoutWithBlurPopUp(
            loraPopUpMessageModel: LoraPopUpMessageModel(
              title: 'Unable to get information',
              subTitle:
                  'There was an error when trying to get your Portfolio. Please try reloading the page',
              primaryButtonLabel: 'RELOAD PAGE',
              secondaryButtonLabel: 'CANCEL',
              onSecondaryButtonTap: () => Navigator.pop(context),
              onPrimaryButtonTap: () {
                context.read<PortfolioBloc>().add(const FetchActiveOrders());
                context.read<PortfolioBloc>().add(FetchPortfolio());
              },
            ),
            showPopUp:
                state.botActiveOrderResponse.state == ResponseState.error ||
                    state.portfolioResponse.state == ResponseState.error,
            content: ListView(
              padding: AppValues.screenHorizontalPadding
                  .copyWith(top: 15, bottom: 15),
              children: [
                _botStockDetail(context, state),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextNew(
                        'Your Botstocks',
                        style: AskLoraTextStyles.h2
                            .copyWith(color: AskLoraColors.charcoal),
                      ),
                    ),
                    BotPortfolioFilter()
                  ],
                ),
                const SizedBox(
                  height: 10,
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
    );
  }

  Widget _botStockDetail(BuildContext context, PortfolioState state) {
    final PortfolioResponse? data = state.portfolioResponse.data;

    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: RoundColoredBox(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomTextNew(
                              'Total Portfolio Value  -  ',
                              style: AskLoraTextStyles.body4,
                            ),
                            CurrencyDropdown(
                              initialValue: CurrencyType.hkd,
                              onChanged: (newValue) {
                                context
                                    .read<PortfolioBloc>()
                                    .add(CurrencyChanged(newValue!));
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        CustomTextNew(
                          style: AskLoraTextStyles.h2,
                          formatCurrency(state.currency, data?.totalPortfolio),
                        ),
                        if (state.currency == CurrencyType.usd)
                          CustomTextNew(
                            'Indicative Quote - HKD1 ≈ USD${0.13}',
                            style: AskLoraTextStyles.body4,
                          )
                      ],
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: RoundColoredBox(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    content: Column(
                      children: [
                        PairColumnText(
                            leftTitle:
                                'Withdrawable\nAmount (${state.currency.value})',
                            rightTitle:
                                'Buying Power\n(${state.currency.value})',
                            rightTooltipText:
                                'Your Buying Power represents the amount of cash that you can use to buy stocks. Your Withdrawable Balance and your Buying Power may not always be the same. For example, starting a Botstock will reduce your Buying Power and the amount value will be added to Total Botstock Values. When the Botstock is expired or terminated, the amount will be added to Buying Power and after T + 2, the amount will be also added to Withdrawable Balance. This is called ‘settlement’.',
                            leftSubTitle: data?.withdrawableAmount != null
                                ? (data!.withdrawableAmount)
                                    .convertToCurrencyDecimal()
                                : '/',
                            rightSubTitle: (data?.buyingPower ?? 0)
                                .convertToCurrencyDecimal()),
                        const SizedBox(
                          height: 14,
                        ),
                        PairColumnText(
                          leftTitle:
                              'Total Botstock\nValues (${state.currency.value})',
                          rightTitle: 'Total P/L\n',
                          leftSubTitle: (data?.totalBotStockValues ?? 0)
                              .convertToCurrencyDecimal(),
                          rightSubTitle: data?.withdrawableAmount != null
                              ? '${(data!.profit).convertToCurrencyDecimal()}%'
                              : '/',
                        ),
                      ],
                    ))),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                FundingButton(
                  disabled: data == null,
                  fundingType: FundingType.fund,
                  onTap: () => DepositWelcomeScreen.open(context: context),
                ),
                const SizedBox(
                  height: 10,
                ),
                FundingButton(
                  disabled: data == null,
                  fundingType: FundingType.withdraw,
                  onTap: () => WithdrawalBankDetailScreen.open(context),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  String formatCurrency(CurrencyType currencyType, double? currency) {
    final value = currency ?? 0;
    return currencyType == CurrencyType.hkd
        ? value.convertToCurrencyDecimal()
        : value.toUsd();
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
