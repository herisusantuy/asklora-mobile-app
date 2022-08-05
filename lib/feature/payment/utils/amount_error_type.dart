enum AmountErrorType { exceedMaxAmount, belowMinAmount, unknown }

AmountErrorType amountError(double amount,
    {double? minAmount, double? maxAmount}) {
  if (minAmount != null && amount < minAmount) {
    return AmountErrorType.belowMinAmount;
  } else if (maxAmount != null && amount > maxAmount) {
    return AmountErrorType.exceedMaxAmount;
  } else {
    return AmountErrorType.unknown;
  }
}
