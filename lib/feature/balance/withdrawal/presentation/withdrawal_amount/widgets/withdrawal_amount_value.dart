part of '../withdrawal_amount_screen.dart';

class WithdrawalAmountValue extends StatelessWidget {
  const WithdrawalAmountValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<WithdrawalBloc, WithdrawalState>(
              buildWhen: (previous, current) =>
                  previous.withdrawalAmount != current.withdrawalAmount,
              builder: (context, state) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: CustomTextNew(
                        'USD',
                        style: AskLoraTextStyles.h5
                            .copyWith(color: AskLoraColors.charcoal),
                      ),
                    ),
                    CustomTextNew(
                      state.withdrawalAmount == 0
                          ? state.withdrawalAmount.toStringAsFixed(0)
                          : state.withdrawalAmount.convertToCurrencyDecimal(),
                      style: AskLoraTextStyles.h1.copyWith(
                          color: state.withdrawalAmount == 0
                              ? AskLoraColors.gray
                              : AskLoraColors.charcoal),
                    ),
                  ],
                );
              }),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextNew(
          'Withdrawable Amount USD4,990.00',
          style:
              AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
        )
      ],
    ));
  }
}
