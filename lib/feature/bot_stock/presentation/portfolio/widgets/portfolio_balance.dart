part of '../portfolio_screen.dart';

class PortfolioBalance extends StatelessWidget {
  final PortfolioResponse? data;
  final CurrencyType currencyType;

  const PortfolioBalance(
      {required this.data, required this.currencyType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _totalPortfolioBalance(context, currencyType, data),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            _portfolioBalanceDetail(context, currencyType, data),
            const SizedBox(
              width: 10,
            ),
            _fundingButtons(context, data)
          ],
        ),
      ],
    );
  }

  Widget _totalPortfolioBalance(BuildContext context, CurrencyType currencyType,
          PortfolioResponse? data) =>
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
                            '${S.of(context).portfolioTotalValue}  -  ',
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
                        formatCurrency(currencyType, data?.totalPortfolio),
                      ),
                      if (currencyType == CurrencyType.usd)
                        CustomTextNew(
                          'Indicative Quote - HKD1 ≈ USD${0.13}',
                          style: AskLoraTextStyles.body4,
                        )
                    ],
                  ),
                ),
              ],
            )),
      );

  Widget _fundingButtons(BuildContext context, PortfolioResponse? data) =>
      Column(
        children: [
          FundingButton(
            disabled: data == null,
            fundingType: FundingType.fund,
            onTap: () {
              UserJourney.onAlreadyPassed(
                  context: context,
                  target: UserJourney.deposit,
                  onTrueCallback: () {
                    DepositWelcomeScreen.open(context: context);
                  },
                  onFalseCallback: () => DepositWelcomeScreen.open(
                      context: context, depositType: DepositType.firstTime));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<AccountInformationBloc, AccountInformationState>(
            builder: (context, state) => FundingButton(
              disabled:
                  data == null || !(state.response.data?.canTrade ?? false),
              fundingType: FundingType.withdraw,
              onTap: () => WithdrawalBankDetailScreen.open(context),
            ),
          ),
        ],
      );

  Widget _portfolioBalanceDetail(BuildContext context,
          CurrencyType currencyType, PortfolioResponse? data) =>
      Expanded(
        child: RoundColoredBox(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: Column(
            children: [
              PairColumnText(
                leftTitle: S
                    .of(context)
                    .portfolioWithdrawableAmount(currencyType.value),
                leftSubTitle: data?.withdrawableAmount != null
                    ? (data!.withdrawableAmount).convertToCurrencyDecimal()
                    : '/',
                rightTitle:
                    S.of(context).portfolioBuyingPower(currencyType.value),
                rightTooltipText: S.of(context).portfolioBuyingPowerToolTip,
                rightSubTitle:
                    (data?.buyingPower ?? 0).convertToCurrencyDecimal(),
                spaceWidth: 6,
              ),
              const SizedBox(
                height: 14,
              ),
              PairColumnText(
                leftTitle:
                    S.of(context).portfolioTotalBotStock(currencyType.value),
                rightTitle: S.of(context).portfolioTotalPL,
                leftSubTitle:
                    (data?.totalBotStockValues ?? 0).convertToCurrencyDecimal(),
                rightSubTitle: data?.withdrawableAmount != null
                    ? '${(data!.profit).convertToCurrencyDecimal()}%'
                    : '/',
                spaceWidth: 6,
              ),
            ],
          ),
        ),
      );
}
