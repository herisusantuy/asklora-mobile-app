import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/extensions.dart';

part 'transaction_balance_model.g.dart';

@JsonSerializable()
class TransactionBalanceModel extends Equatable {
  @JsonKey(name: 'fully_settled_balance_hkd')
  final String fullySettledBalanceHkd;
  @JsonKey(name: 'fully_settled_balance_usd')
  final String fullySettledBalanceUsd;
  @JsonKey(name: 'withdrawable_balance')
  final String withdrawableBalance;

  ///below variable is not yet available from endpoint side
  final double? totalPortfolio;
  final double? buyingPower;
  final double? totalBotstockValue;
  final double? totalPnL;

  const TransactionBalanceModel(
      this.fullySettledBalanceHkd,
      this.fullySettledBalanceUsd,
      this.withdrawableBalance,
      this.totalPortfolio,
      this.buyingPower,
      this.totalBotstockValue,
      this.totalPnL);

  factory TransactionBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBalanceModelToJson(this);

  String get withdrawableBalanceStr => withdrawableBalance.isNotEmpty
      ? checkDouble(withdrawableBalance).convertToCurrencyDecimal()
      : '/';

  String get buyingPowerStr => buyingPower != null
      ? checkDouble(buyingPower).convertToCurrencyDecimal()
      : '/';

  String get totalBotstockValueStr => totalBotstockValue != null
      ? checkDouble(totalBotstockValue).convertToCurrencyDecimal()
      : '/';

  String get totalPnLStr =>
      totalPnL != null ? checkDouble(totalPnL).convertToCurrencyDecimal() : '/';

  @override
  List<Object> get props =>
      [fullySettledBalanceHkd, fullySettledBalanceUsd, withdrawableBalance];
}
