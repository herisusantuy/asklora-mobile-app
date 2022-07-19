import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'disclosures.g.dart';

@JsonSerializable()
class Disclosures extends Equatable {
  @JsonKey(name: 'is_control_person')
  bool? isControlPerson;

  @JsonKey(name: 'is_affiliated_exchange_or_finra')
  bool? isAffiliatedExchangeOrFinra;

  @JsonKey(name: 'is_politically_exposed')
  bool? isPoliticallyExposed;

  @JsonKey(name: 'immediate_family_exposed')
  bool? immediateFamilyExposed;

  @JsonKey(name: 'employment_status')
  String? employmentStatus;

  Disclosures(
      {this.isControlPerson,
      this.isAffiliatedExchangeOrFinra,
      this.isPoliticallyExposed,
      this.immediateFamilyExposed,
      this.employmentStatus});

  factory Disclosures.fromJson(Map<String, dynamic> json) =>
      _$DisclosuresFromJson(json);

  Map<String, dynamic> toJson() => _$DisclosuresToJson(this);

  @override
  List<Object> get props => [
        isControlPerson ?? false,
        isAffiliatedExchangeOrFinra ?? false,
        isPoliticallyExposed ?? false,
        immediateFamilyExposed ?? false,
        employmentStatus ?? false
      ];
}
