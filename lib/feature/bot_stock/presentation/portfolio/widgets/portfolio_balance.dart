part of '../portfolio_screen.dart';

class PortfolioBalance extends StatelessWidget {
  final TransactionBalanceResponse? data;
  final CurrencyType currencyType;

  const PortfolioBalance(
      {required this.data, required this.currencyType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _currencyDropdownButton(),
        const SizedBox(
          height: 7,
        ),
        _totalPortfolioBalance(context, currencyType, data),
        const SizedBox(
          height: 18,
        ),
        _portfolioBalanceDetail(context, currencyType, data),
        const SizedBox(
          height: 14,
        ),
        _fundingButtons(context, data),
      ],
    );
  }

  Widget _currencyDropdownButton() {
    return Container(
      transform: Matrix4.translationValues(0, -8, 0),
      child: BlocBuilder<PortfolioBloc, PortfolioState>(
        buildWhen: (previous, current) => previous.currency != current.currency,
        builder: (context, state) => CurrencyDropdown(
          onChanged: (newValue) =>
              context.read<PortfolioBloc>().add(CurrencyChanged(newValue!)),
          initialValue: state.currency,
        ),
      ),
    );
  }

  Widget _totalPortfolioBalance(BuildContext context, CurrencyType currencyType,
      TransactionBalanceResponse? data) {
    return Column(
      children: [
        CustomTextNew(
          style: AskLoraTextStyles.h2,
          currencyType == CurrencyType.hkd
              ? data?.totalPortfolioHkdStr ?? '0.0'
              : data?.totalPortfolioUsdStr ?? '0.0',
        ),
        CustomTextNew(
          S.of(context).portfolioTotalValue,
          style: AskLoraTextStyles.body4,
        ),
      ],
    );
  }

  Widget _fundingButtons(
          BuildContext context, TransactionBalanceResponse? data) =>
      Row(
        children: [
          Expanded(
            child: FundingButton(
              disabled: data == null,
              fundingType: FundingType.fund,
              onTap: () => UserJourney.onAlreadyPassed(
                context: context,
                target: UserJourney.deposit,
                onTrueCallback: () {
                  DepositWelcomeScreen.open(context: context);
                },
                onFalseCallback: () => DepositWelcomeScreen.open(
                    context: context, depositType: DepositType.firstTime),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: BlocBuilder<AccountInformationBloc, AccountInformationState>(
              builder: (context, state) => FundingButton(
                disabled:
                    data == null || !(state.response.data?.canTrade ?? false),
                fundingType: FundingType.withdraw,
                onTap: () => WithdrawalBankDetailScreen.open(
                    context, data!.withdrawableBalanceHkd),
              ),
            ),
          ),
        ],
      );

  Widget _portfolioBalanceDetail(BuildContext context,
          CurrencyType currencyType, TransactionBalanceResponse? data) =>
      RoundColoredBox(
        radius: 30,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        content: Column(
          children: [
            PairColumnTextWithTooltip(
              columnTextCrossAxisAlignment: CrossAxisAlignment.center,
              leftTitle: S.of(context).portfolioBuyingPower(currencyType.name),
              leftSubTitle: currencyType == CurrencyType.hkd
                  ? data?.buyingPowerHkdStr ?? '/'
                  : data?.buyingPowerUsdStr ?? '/',
              leftTooltipText: S.of(context).portfolioBuyingPowerToolTip,
              rightTitle: S.of(context).portfolioTotalPL,
              rightSubTitle: data?.totalPnLStr ?? '/',
              rightSubTitleColor: data?.totalPnLColor,
              spaceWidth: 6,
            ),
            const SizedBox(
              height: 23,
            ),
            PairColumnTextWithTooltip(
              columnTextCrossAxisAlignment: CrossAxisAlignment.center,
              leftTitle:
                  S.of(context).portfolioWithdrawableAmount(currencyType.name),
              leftSubTitle: currencyType == CurrencyType.hkd
                  ? data?.withdrawableBalanceHkdStr ?? '/'
                  : data?.withdrawableBalanceUsdStr ?? '/',
              rightTitle:
                  S.of(context).portfolioTotalBotStock(currencyType.name),
              rightSubTitle: currencyType == CurrencyType.hkd
                  ? data?.totalBotstockHkdStr ?? '/'
                  : data?.totalBotstockUsdStr ?? '/',
              spaceWidth: 6,
            ),
          ],
        ),
      );
}
