import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agreement.g.dart';

@JsonSerializable()
class Agreement extends Equatable {
  String? agreement;

  @JsonKey(name: 'ip_address')
  String? ipAddress;

  String? signature;

  Agreement({this.agreement, this.ipAddress, this.signature});

  factory Agreement.fromJson(Map<String, dynamic> json) =>
      _$AgreementFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementToJson(this);

  @override
  List<Object> get props => [agreement ?? '', ipAddress ?? '', signature ?? ''];
}
