import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bot_balance.g.dart';

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
