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
import '../../../../core/utils/extensions.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';

import '../../utils/bot_stock_utils.dart';
import '../widgets/pair_column_text.dart';
import 'bloc/portfolio_bloc.dart';
import 'detail/bot_portfolio_detail_screen.dart';
import 'domain/portfolio_detail_response.dart';
import 'repository/portfolio_repository.dart';
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
      create: (_) => PortfolioBloc(portfolioRepository: PortfolioRepository())
        ..add(const FetchBotPortfolio())
        ..add(FetchPortfolioDetail()),
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
                style: AskLoraTextStyles.h2
                    .copyWith(color: AskLoraColors.charcoal),
              ),
              const SizedBox(
                height: 10,
              ),
              BotPortfolioList(
                userJourney: context.read<AppBloc>().state.userJourney,
              ),
            ],
          )),
    );
  }

  Widget get _botStockDetail => BlocBuilder<PortfolioBloc, PortfolioState>(
      buildWhen: (previous, current) =>
          previous.portfolioDetailResponse != current.portfolioDetailResponse,
      builder: (context, state) {
        final PortfolioDetailResponse? data =
            state.portfolioDetailResponse.data;
        return Column(
          children: [
            SafeArea(
              bottom: false,
              child: RoundColoredBox(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  content: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextNew(
                              'Total Portfolio Value (USD)',
                              style: AskLoraTextStyles.body4,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            CustomTextNew(
                              (data?.totalPortfolio ?? 0)
                                  .convertToCurrencyDecimal(),
                              style: AskLoraTextStyles.h2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: AskLoraColors.charcoal,
                            shape: BoxShape.circle),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AskLoraColors.primaryGreen,
                          size: 22,
                        ),
                      )
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
                                title1: 'Withdrawable Amount (USD)',
                                title2: 'Buying Power (USD)',
                                subTitle1: data?.withdrawableAmount != null
                                    ? data!.withdrawableAmount
                                        .convertToCurrencyDecimal()
                                    : '/',
                                subTitle2: (data?.buyingPower ?? 0)
                                    .convertToCurrencyDecimal()),
                            const SizedBox(
                              height: 14,
                            ),
                            PairColumnText(
                              title1: 'Total Values',
                              title2: 'Total P/L',
                              subTitle1: (data?.totalBotStockValues ?? 0)
                                  .convertToCurrencyDecimal(),
                              subTitle2: data?.withdrawableAmount != null
                                  ? '${data!.withdrawableAmount.convertToCurrencyDecimal()}%'
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
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FundingButton(
                      disabled: data == null,
                      fundingType: FundingType.withdraw,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      });

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
