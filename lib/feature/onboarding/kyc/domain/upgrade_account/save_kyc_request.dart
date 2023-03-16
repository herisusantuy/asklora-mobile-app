import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import 'personal_info_request.dart';
import 'upgrade_account_request.dart';

part 'save_kyc_request.g.dart';

@JsonSerializable(explicitToJson: true)
class SaveKycRequest extends Equatable {
  @JsonKey(name: 'upgrade_account_request')
  final UpgradeAccountRequest upgradeAccountRequest;
  final bool? immediateFamilyAffiliation;
  final bool? associatesAffiliation;

  @JsonKey(name: 'proofs_of_address')
  final PersonalInfoRequest personalInfoRequest;

  const SaveKycRequest(
      {required this.upgradeAccountRequest,
      required this.personalInfoRequest,
      this.immediateFamilyAffiliation,
      this.associatesAffiliation});

  static SaveKycRequest getRequestForSavingKyc(BuildContext context) {
    return SaveKycRequest(
      upgradeAccountRequest:
          UpgradeAccountRequest.getRequestForSavingKyc(context),
      personalInfoRequest: PersonalInfoRequest.getRequestForSavingKyc(context),
      immediateFamilyAffiliation:
          context.read<DisclosureAffiliationBloc>().state.isAffiliatedPerson,
      associatesAffiliation: context
          .read<DisclosureAffiliationBloc>()
          .state
          .isAffiliatedAssociates,
    );
  }

  factory SaveKycRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveKycRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveKycRequestToJson(this);

  @override
  List<Object> get props => [upgradeAccountRequest, personalInfoRequest];

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
