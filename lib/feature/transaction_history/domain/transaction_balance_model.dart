import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/UtilTest/extensions.dart';

part 'transaction_balance_model.g.dart';

@JsonSerializable()
class TransactionBalanceModel extends Equatable {
  @JsonKey(name: 'fully_settled_balance_hkd')
  final String fullySettledBalanceHkd;
  @JsonKey(name: 'fully_settled_balance_usd')
  final String fullySettledBalanceUsd;
  @JsonKey(name: 'withdrawable_balance')
  final String withdrawableBalance;

  const TransactionBalanceModel(this.fullySettledBalanceHkd,
      this.fullySettledBalanceUsd, this.withdrawableBalance);

  factory TransactionBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionBalanceModelFromJson(json);

  String get withdrawableBalanceStr =>
      checkDouble(withdrawableBalance).convertToCurrencyDecimal();

  @override
  List<Object> get props =>
      [fullySettledBalanceHkd, fullySettledBalanceUsd, withdrawableBalance];
}
