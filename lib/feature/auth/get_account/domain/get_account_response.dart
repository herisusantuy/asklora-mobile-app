import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'trade_requirements_status.dart';

part 'get_account_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAccountResponse {
  final String email;
  @JsonKey(name: 'trade_requirements_status')
  final TradeRequirementsStatus tradeRequirementsStatus;
  @JsonKey(name: 'trade_status')
  final bool tradeStatus;

  const GetAccountResponse(
    this.email,
    this.tradeRequirementsStatus,
    this.tradeStatus,
  );

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountResponseToJson(this);
}
