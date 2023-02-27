import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_info_response.g.dart';

@JsonSerializable()
class PersonalInfoResponse extends Equatable {
  final String? detail;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final String? city;
  @JsonKey(name: 'address_line_2')
  final String? addressLine2;

  const PersonalInfoResponse({
    this.detail,
    this.postalCode,
    this.city,
    this.addressLine2,
  });

  factory PersonalInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoResponseToJson(this);

  @override
  List<Object?> get props => [
        detail ?? '',
        postalCode ?? '',
        city ?? '',
        addressLine2 ?? '',
      ];
}
