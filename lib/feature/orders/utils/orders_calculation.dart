import '../../../core/utils/extensions.dart';

double calculateEstimateTotal(double marketPrice, double sharesAmount) {
  return (marketPrice * sharesAmount).toPrecision(1);
}

double calculateAmount(double marketPrice, double amount) {
  return (amount / marketPrice).toPrecision(1);
}

double calculateNumberOfBuyableShares(
    double marketPrice, double availableBuyingPower) {
  return (availableBuyingPower / marketPrice).toPrecision(1);
}

double calculateAvailableAmountToSell(
    double marketPrice, double numberOfSellableShares) {
  return (numberOfSellableShares * marketPrice).toPrecision(1);
}

double incrementSharesAmount(double sharesAmount) {
  return (sharesAmount + 0.1).toPrecision(1);
}

double decrementSharesAmount(double sharesAmount) {
  return (sharesAmount - 0.1).toPrecision(1);
}
