import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'residence.g.dart';

@JsonSerializable()
class Residence extends Equatable {
  @JsonKey(name: 'address_line_1')
  final String? addressLine1;
  @JsonKey(name: 'address_line_2')
  final String? addressLine2;
  final String? district;
  final String? region;
  final String? country;

  const Residence({
    this.addressLine1,
    this.addressLine2,
    this.district,
    this.region,
    this.country,
  });

  factory Residence.fromJson(Map<String, dynamic> json) =>
      _$ResidenceFromJson(json);

  Map<String, dynamic> toJson() => _$ResidenceToJson(this);

  @override
  List<Object> get props => [
        addressLine1 ?? '',
        addressLine2 ?? '',
        district ?? '',
        region ?? '',
        country ?? '',
      ];
}
