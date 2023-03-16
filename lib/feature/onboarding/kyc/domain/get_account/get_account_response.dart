import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'account_contact.dart';
import 'account_identity.dart';
import 'trade_requirements_status.dart';

part 'get_account_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAccountResponse extends Equatable {
  final String email;
  @JsonKey(name: 'trade_requirements_status')
  final TradeRequirementsStatus tradeRequirementsStatus;
  @JsonKey(name: 'trade_status')
  final bool tradeStatus;
  @JsonKey(name: 'contact')
  final AccountContact? contact;
  @JsonKey(name: 'identity')
  final AccountIdentity? identity;

  const GetAccountResponse(
    this.email,
    this.tradeRequirementsStatus,
    this.tradeStatus,
    this.contact,
    this.identity,
  );

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountResponseToJson(this);

  @override
  List<Object?> get props => [];
}
