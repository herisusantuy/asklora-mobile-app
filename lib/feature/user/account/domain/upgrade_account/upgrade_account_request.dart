import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'agreement.dart';
import 'contact.dart';
import 'disclosures.dart';
import 'identity.dart';
import 'trusted_contact.dart';

part 'upgrade_account_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpgradeAccountRequest extends Equatable {
  Contact? contact;

  Identity? identity;

  @JsonKey(name: 'trusted_contact')
  TrustedContact? trustedContact;

  Disclosures? disclosures;

  List<Agreement>? agreements;

  UpgradeAccountRequest(
      {this.contact,
      this.identity,
      this.trustedContact,
      this.disclosures,
      this.agreements});

  factory UpgradeAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$UpgradeAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeAccountRequestToJson(this);

  @override
  List<Object> get props =>
      [contact!, identity!, trustedContact!, disclosures!, agreements!];
}
