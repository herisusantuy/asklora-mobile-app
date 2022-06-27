import 'package:json_annotation/json_annotation.dart';

part 'trade_requirements_status.g.dart';

@JsonSerializable()
class TradeRequirementsStatus {
  final bool identity;
  final bool contact;
  final bool disclosures;
  final bool agreement;
  final bool kyc;

  TradeRequirementsStatus(
    this.identity,
    this.contact,
    this.disclosures,
    this.agreement,
    this.kyc,
  );
  factory TradeRequirementsStatus.fromJson(Map<String, dynamic> json) =>
      _$TradeRequirementsStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TradeRequirementsStatusToJson(this);
}
