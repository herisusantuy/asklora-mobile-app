import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employment_info.g.dart';

@JsonSerializable()
class EmploymentInfo extends Equatable {
  @JsonKey(name: 'employment_status')
  final String? employmentStatus;

  final String? employer;
  @JsonKey(name: 'employer_business')
  final String? employerBusiness;
  final String? occupation;
  @JsonKey(name: 'employer_address_line_1')
  final String? employerAddressLine1;
  @JsonKey(name: 'employer_address_line_2')
  final String? employerAddressLine2;
  final String? district;
  final String? region;
  final String? country;

  const EmploymentInfo({
    this.employmentStatus,
    this.employer,
    this.employerBusiness,
    this.occupation,
    this.employerAddressLine1,
    this.employerAddressLine2,
    this.district,
    this.region,
    this.country,
  });

  factory EmploymentInfo.fromJson(Map<String, dynamic> json) =>
      _$EmploymentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentInfoToJson(this);

  @override
  List<Object> get props => [
        employmentStatus ?? '',
        employer ?? '',
        employerBusiness ?? '',
        occupation ?? '',
        employerAddressLine1 ?? '',
        employerAddressLine2 ?? '',
        district ?? '',
        region ?? '',
        country ?? '',
      ];
}
