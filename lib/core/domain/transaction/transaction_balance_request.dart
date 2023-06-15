import 'package:json_annotation/json_annotation.dart';

part 'transaction_balance_request.g.dart';

@JsonSerializable()
class TransactionBalanceRequest {
  final String currency;

  const TransactionBalanceRequest(this.currency);

  factory TransactionBalanceRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionBalanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBalanceRequestToJson(this);
}
