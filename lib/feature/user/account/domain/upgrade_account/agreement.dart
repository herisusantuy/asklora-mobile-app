import 'package:json_annotation/json_annotation.dart';

part 'agreement.g.dart';

@JsonSerializable()
class Agreement {

  @JsonKey(name: 'agreement')
  String? agreement;

  @JsonKey(name: 'ip_address')
  String? ipAddress;

  Agreement({this.agreement, this.ipAddress});

  factory Agreement.fromJson(Map<String, dynamic> json) =>
      _$AgreementFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementToJson(this);
}
