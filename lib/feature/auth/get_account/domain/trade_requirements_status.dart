import 'package:json_annotation/json_annotation.dart';

part 'trade_requirements_status.g.dart';

@JsonSerializable()
class TradeRequirementsStatus {
  bool identity;
  bool contact;
  bool disclosures;
  bool agreement;
  bool kyc;
  bool document;

  TradeRequirementsStatus(this.identity, this.contact, this.disclosures,
      this.agreement, this.kyc, this.document);
  factory TradeRequirementsStatus.fromJson(Map<String, dynamic> json) =>
      _$TradeRequirementsStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TradeRequirementsStatusToJson(this);
}
