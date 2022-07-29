import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'context.dart';

part 'disclosures.g.dart';

@JsonSerializable()
class Disclosures extends Equatable {
  @JsonKey(name: 'is_control_person')
  final bool? isControlPerson;

  @JsonKey(name: 'is_affiliated_exchange_or_finra')
  final bool? isAffiliatedExchangeOrFinra;

  @JsonKey(name: 'is_politically_exposed')
  final bool? isPoliticallyExposed;

  @JsonKey(name: 'immediate_family_exposed')
  final bool? immediateFamilyExposed;

  @JsonKey(name: 'employment_status')
  final String? employmentStatus;

  @JsonKey(name: 'employer_name')
  final String? employerName;

  @JsonKey(name: 'employer_address')
  final String? employerAddress;

  @JsonKey(name: 'employment_position')
  final String? employmentPosition;

  final List<Context>? context;

  const Disclosures(
      {this.isControlPerson,
      this.isAffiliatedExchangeOrFinra,
      this.isPoliticallyExposed,
      this.immediateFamilyExposed,
      this.employmentStatus,
      this.employerName,
      this.employerAddress,
      this.employmentPosition,
      this.context});

  factory Disclosures.fromJson(Map<String, dynamic> json) =>
      _$DisclosuresFromJson(json);

  Map<String, dynamic> toJson() => _$DisclosuresToJson(this);

  @override
  List<Object> get props => [
        isControlPerson ?? false,
        isAffiliatedExchangeOrFinra ?? false,
        isPoliticallyExposed ?? false,
        immediateFamilyExposed ?? false,
        employmentStatus ?? false,
        employerName ?? '',
        employerAddress ?? '',
        employmentPosition ?? '',
        context ?? []
      ];
}
