import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../../../../core/domain/pair.dart';
import '../../../../../../core/presentation/buttons/others/funding_button.dart';
import '../../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/presentation/text_fields/custom_dropdown.dart';
import '../../../../../../core/presentation/text_fields/style/text_field_style.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../../core/presentation/shimmer.dart';
import '../../../../core/utils/currency_enum.dart';
import '../../../../core/utils/extensions.dart';
import '../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../balance/withdrawal/presentation/withdrawal_bank_detail_screen.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../utils/bot_stock_utils.dart';
import '../widgets/currency_button.dart';
import '../widgets/pair_column_text.dart';
import 'bloc/portfolio_bloc.dart';
import 'detail/bot_portfolio_detail_screen.dart';
import 'domain/portfolio_detail_response.dart';
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
        PortfolioBloc portfolioBloc =
            PortfolioBloc(portfolioRepository: PortfolioRepository());

        ///fetch portfolio when current UserJourney already passed freeBotStock
        if (UserJourney.compareUserJourney(
            source: context.read<AppBloc>().state.userJourney,
            target: UserJourney.freeBotStock)) {
          portfolioBloc.add(const FetchBotPortfolio());
          portfolioBloc.add(FetchPortfolioDetail());
        }
        return portfolioBloc;
      },
      child: CustomScaffold(
        useSafeArea: false,
        backgroundColor: AskLoraColors.white,
        enableBackNavigation: false,
        body: ListView(
          padding:
              AppValues.screenHorizontalPadding.copyWith(top: 15, bottom: 15),
          children: [
            _botStockDetail,
            const SizedBox(
              height: 40,
            ),
            CustomTextNew(
              'Your Botstocks',
              style:
                  AskLoraTextStyles.h2.copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<AppBloc, AppState>(
              buildWhen: (previous, current) =>
                  previous.userJourney != current.userJourney,
              builder: (context, state) => BotPortfolioList(
                userJourney: state.userJourney,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _botStockDetail {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
        buildWhen: (previous, current) =>
            previous.portfolioDetailResponse !=
                current.portfolioDetailResponse ||
            previous.currency != current.currency,
        builder: (context, state) {
          final PortfolioDetailResponse? data =
              state.portfolioDetailResponse.data;

          return Column(
            children: [
              SafeArea(
                bottom: false,
                child: RoundColoredBox(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
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
                                    'Total Portfolio Value   -   ',
                                    style: AskLoraTextStyles.body4,
                                  ),
                                  CurrencyButton(
                                    initialValue: CurrencyType.hkd.value,
                                    items: CurrencyType.values
                                        .map((e) => e.value)
                                        .toList(),
                                    onChanged: (newValue) {
                                      context.read<PortfolioBloc>().add(
                                          CurrencyChanged(CurrencyType.values
                                              .firstWhere((element) =>
                                                  element.value == newValue)));
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              CustomTextNew(
                                (data?.totalPortfolio ?? 0)
                                    .convertToCurrencyDecimal(),
                                style: AskLoraTextStyles.h2,
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
                                  title1:
                                      'Withdrawable\nAmount (${state.currency.value})',
                                  title2:
                                      'Buying Power\n(${state.currency.value})',
                                  subTitle1: data?.withdrawableAmount != null
                                      ? (data!.withdrawableAmount)
                                          .convertToCurrencyDecimal()
                                      : '/',
                                  subTitle2: (data?.buyingPower ?? 0)
                                      .convertToCurrencyDecimal()),
                              const SizedBox(
                                height: 14,
                              ),
                              PairColumnText(
                                title1:
                                    'Total Botstock\nValues (${state.currency.value})',
                                title2: 'Total P/L\n',
                                subTitle1: (data?.totalBotStockValues ?? 0)
                                    .convertToCurrencyDecimal(),
                                subTitle2: data?.withdrawableAmount != null
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
                        onTap: () =>
                            DepositWelcomeScreen.open(context: context),
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
        });
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
