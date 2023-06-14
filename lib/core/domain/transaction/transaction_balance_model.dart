import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/extensions.dart';

part 'transaction_balance_model.g.dart';

@JsonSerializable()
class TransactionBalanceModel extends Equatable {
  @JsonKey(name: 'withdrawable_balance')
  final double withdrawableBalance;
  @JsonKey(name: 'buying_power')
  final double buyingPower;
  @JsonKey(name: 'total_bot_stock')
  final double totalBotStock;
  @JsonKey(name: 'total_pnl_pct')
  final double totalPnLPct;
  @JsonKey(name: 'total_portfolio')
  final double totalPortfolio;

  const TransactionBalanceModel(this.withdrawableBalance, this.buyingPower,
      this.totalBotStock, this.totalPnLPct, this.totalPortfolio);

  factory TransactionBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBalanceModelToJson(this);

  String get withdrawableBalanceStr => withdrawableBalance != 0
      ? withdrawableBalance.convertToCurrencyDecimal()
      : '/';

  String get buyingPowerStr =>
      buyingPower != 0 ? buyingPower.convertToCurrencyDecimal() : '/';

  String get totalBotstockValueStr =>
      totalBotStock != 0 ? totalBotStock.convertToCurrencyDecimal() : '/';

  String get totalPnLStr =>
      totalPnLPct != 0 ? totalPnLPct.convertToCurrencyDecimal() : '/';

  @override
  List<Object> get props => [
        withdrawableBalance,
        buyingPower,
        totalBotStock,
        totalPnLPct,
        totalPortfolio
      ];
}
