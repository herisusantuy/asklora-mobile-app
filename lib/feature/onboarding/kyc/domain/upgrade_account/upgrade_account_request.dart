import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'affiliated_person.dart';
import 'agreement.dart';
import 'employment_info.dart';
import 'proofs_of_address.dart';
import 'residence.dart';
import 'wealth_sources.dart';

part 'upgrade_account_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpgradeAccountRequest extends Equatable {
  final Residence? residence;
  @JsonKey(name: 'proofs_of_address')
  final List<ProofsOfAddress>? proofsOfAddress;

  @JsonKey(name: 'employment_info')
  final EmploymentInfo? employmentInfo;

  @JsonKey(name: 'wealth_sources')
  final List<WealthSources>? wealthSources;

  @JsonKey(name: 'affiliated_person')
  final AffiliatedPerson? affiliatedPerson;

  final List<Agreement>? agreements;

  const UpgradeAccountRequest({
    this.residence,
    this.proofsOfAddress,
    this.employmentInfo,
    this.wealthSources,
    this.affiliatedPerson,
    this.agreements,
  });

  factory UpgradeAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$UpgradeAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeAccountRequestToJson(this);

  @override
  List<Object> get props => [
        residence!,
        proofsOfAddress!,
        employmentInfo!,
        wealthSources!,
        affiliatedPerson!,
        agreements!,
      ];
}
