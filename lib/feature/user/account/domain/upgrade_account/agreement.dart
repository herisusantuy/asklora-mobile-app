import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agreement.g.dart';

@JsonSerializable()
class Agreement extends Equatable {
  final String? agreement;

  @JsonKey(name: 'ip_address')
  final String? ipAddress;

  const Agreement({
    required this.agreement,
    required this.ipAddress,
  });

  factory Agreement.fromJson(Map<String, dynamic> json) =>
      _$AgreementFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementToJson(this);

  @override
  List<Object> get props => [agreement ?? '', ipAddress ?? ''];
}
