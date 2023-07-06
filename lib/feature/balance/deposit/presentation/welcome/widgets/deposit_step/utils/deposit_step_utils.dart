part of '../../../deposit_welcome_screen.dart';

List<DepositStepModel> firstTimeDepositStep(BuildContext context) {
  final List<DepositStepModel> firstTimeStep = [
    DepositStepModel(
      title: S.of(context).depositViaFpsOrWireTransfer,
      subTitle: S.of(context).transferAtLeastWithMinimumDeposit(
          DepositType.type1.minDepositString),
    ),
    DepositStepModel(
      title: S.of(context).inputDepositAmount,
      subTitle: S.of(context).theAmountMustMatch,
    ),
    DepositStepModel(
      title: S.of(context).uploadProofOfRemittance,
      subTitle: S.of(context).theProofOfRemittanceShouldShowYourBankAccount,
    ),
    DepositStepModel(
      title: S.of(context).yourDepositCanTakeUp2WorkingDays,
    ),
  ];
  return firstTimeStep;
}

List<DepositStepModel> type1DepositStep(BuildContext context) {
  final List<DepositStepModel> type1Step = [
    DepositStepModel(
      title: S.of(context).depositViaFpsOrWireTransfer,
      subTitle: S.of(context).transferAtLeastWithMinimumDeposit(
          DepositType.type1.minDepositString),
    ),
    DepositStepModel(
      title: S.of(context).inputDepositAmount,
      subTitle: S.of(context).theAmountMustMatch,
    ),
    DepositStepModel(
      title: S.of(context).yourDepositCanTakeUp2WorkingDays,
    ),
  ];
  return type1Step;
}

List<DepositStepModel> type2DepositStep(BuildContext context) {
  final List<DepositStepModel> type2Step = [
    DepositStepModel(
        title: S.of(context).depositViaFpsOrWireTransfer,
        subTitle: DepositType.type1.minDeposit != 0
            ? S.of(context).transferAtLeastWithMinimumDeposit(
                DepositType.type1.minDepositString)
            : S.of(context).transferAtLeastWithNoMinimumDeposit),
    DepositStepModel(
      title: S.of(context).inputDepositAmount,
      subTitle: S.of(context).theAmountMustMatch,
    ),
    DepositStepModel(
      title: S.of(context).yourDepositCanTakeUp2WorkingDays,
    ),
  ];
  return type2Step;
}
