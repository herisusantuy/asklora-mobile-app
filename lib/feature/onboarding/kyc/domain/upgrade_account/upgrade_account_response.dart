import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'affiliated_person.dart';
import 'agreement.dart';
import 'proofs_of_address.dart';
import 'trusted_contact.dart';

part 'upgrade_account_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UpgradeAccountResponse extends Equatable {
  @JsonKey(name: 'proofs_of_address')
  final List<ProofsOfAddress>? proofsOfAddress;

  @JsonKey(name: 'employment_info')
  final ProofsOfAddress? employmentInfo;

  @JsonKey(name: 'wealth_sources')
  final List<TrustedContact>? wealthSources;

  @JsonKey(name: 'affiliated_person')
  final AffiliatedPerson? affiliatedPerson;

  final List<Agreement>? agreements;

  const UpgradeAccountResponse({
    this.proofsOfAddress,
    this.employmentInfo,
    this.wealthSources,
    this.affiliatedPerson,
    this.agreements,
  });

  factory UpgradeAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UpgradeAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeAccountResponseToJson(this);

  @override
  List<Object> get props => [
        proofsOfAddress!,
        employmentInfo!,
        wealthSources!,
        affiliatedPerson!,
        agreements!,
      ];
}
