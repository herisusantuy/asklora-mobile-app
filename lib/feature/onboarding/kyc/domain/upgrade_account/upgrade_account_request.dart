import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'agreement.dart';
import 'contact.dart';
import 'disclosures.dart';
import 'personal_info.dart';
import 'proofs_of_address.dart';
import 'trusted_contact.dart';

part 'upgrade_account_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpgradeAccountRequest extends Equatable {
  @JsonKey(name: 'personal_info')
  final PersonalInfo? personalInfo;

  @JsonKey(name: 'proofs_of_address')
  final List<ProofsOfAddress>? proofsOfAddress;

  @JsonKey(name: 'employment_info')
  final ProofsOfAddress? employmentInfo;

  @JsonKey(name: 'wealth_sources')
  final List<TrustedContact>? wealthSources;

  @JsonKey(name: 'affiliated_person')
  final TrustedContact? affiliatedPerson;

  final List<Agreement>? agreements;

  const UpgradeAccountRequest({
    this.personalInfo,
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
        personalInfo!,
        proofsOfAddress!,
        employmentInfo!,
        wealthSources!,
        affiliatedPerson!,
        agreements!,
      ];
}
