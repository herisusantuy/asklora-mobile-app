import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agreement.g.dart';

@JsonSerializable()
class Agreement extends Equatable {
  final String? agreement;

  @JsonKey(name: 'ip_address')
  final String? ipAddress;

  final String? signature;

  @JsonKey(name: 'signed_at')
  final String? signedAt;

  const Agreement(
      {required this.agreement,
      required this.signedAt,
      required this.ipAddress,
      required this.signature});

  factory Agreement.fromJson(Map<String, dynamic> json) =>
      _$AgreementFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementToJson(this);

  @override
  List<Object> get props => [agreement ?? '', ipAddress ?? '', signature ?? ''];
}
