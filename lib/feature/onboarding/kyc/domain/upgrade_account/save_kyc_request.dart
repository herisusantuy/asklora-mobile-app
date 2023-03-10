import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'personal_info_request.dart';
import 'upgrade_account_request.dart';

part 'save_kyc_request.g.dart';

@JsonSerializable(explicitToJson: true)
class SaveKycRequest extends Equatable {
  @JsonKey(name: 'upgrade_account_request')
  final UpgradeAccountRequest upgradeAccountRequest;

  @JsonKey(name: 'proofs_of_address')
  final PersonalInfoRequest personalInfoRequest;

  const SaveKycRequest({
    required this.upgradeAccountRequest,
    required this.personalInfoRequest,
  });

  static SaveKycRequest getSaveKycRequest(BuildContext context) =>
      SaveKycRequest(
          upgradeAccountRequest:
              UpgradeAccountRequest.getRequestFromKycStates(context),
          personalInfoRequest:
              PersonalInfoRequest.getRequestFromPersonalInfoState(context));

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
