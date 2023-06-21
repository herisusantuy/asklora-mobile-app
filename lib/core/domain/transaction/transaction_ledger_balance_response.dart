import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/extensions.dart';

part 'transaction_ledger_balance_response.g.dart';

@JsonSerializable()
class TransactionLedgerBalanceResponse extends Equatable {
  @JsonKey(name: 'fully_settled_balance_hkd')
  final double fullySettledBalanceHkd;
  @JsonKey(name: 'fully_settled_balance_usd')
  final double fullySettledBalanceUsd;
  @JsonKey(name: 'buying_power')
  final double buyingPower;
  @JsonKey(name: 'withdrawable_balance')
  final double withdrawableBalance;
  @JsonKey(name: 'account_name')
  final String accountName;
  @JsonKey(name: 'user_id')
  final double userId;
  @JsonKey(name: 'bot_balances')
  final List<BotBalance> botBalances;

  const TransactionLedgerBalanceResponse(
    this.fullySettledBalanceHkd,
    this.fullySettledBalanceUsd,
    this.buyingPower,
    this.withdrawableBalance,
    this.accountName,
    this.userId,
    this.botBalances,
  );

  factory TransactionLedgerBalanceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TransactionLedgerBalanceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TransactionLedgerBalanceResponseToJson(this);

  String get buyingPowerStr =>
      buyingPower != 0 ? buyingPower.convertToCurrencyDecimal() : '/';

  @override
  List<Object> get props => [
        fullySettledBalanceHkd,
        fullySettledBalanceUsd,
        buyingPower,
        withdrawableBalance,
        accountName,
        userId,
        botBalances,
      ];
}

@JsonSerializable()
class BotBalance extends Equatable {
  @JsonKey(name: 'fully_settled_balance_hkd')
  final double fullySettledBalanceHkd;
  @JsonKey(name: 'fully_settled_balance_usd')
  final double fullySettledBalanceUsd;
  final String name;
  @JsonKey(name: 'fully_settled_share_positions')
  final Map<String, String>? fullySettledSharePositions;

  const BotBalance(
    this.fullySettledBalanceHkd,
    this.fullySettledBalanceUsd,
    this.name,
    this.fullySettledSharePositions,
  );

  factory BotBalance.fromJson(Map<String, dynamic> json) =>
      _$BotBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BotBalanceToJson(this);

  @override
  List<Object> get props => [
        fullySettledBalanceHkd,
        fullySettledBalanceUsd,
        name,
      ];
}
