import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../upgrade_account/agreement.dart';
import '../upgrade_account/employment_info.dart';
import '../upgrade_account/personal_info_request.dart';
import '../upgrade_account/residence_info_request.dart';

part 'get_account_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAccountResponse extends Equatable {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'personal_info')
  final PersonalInfoRequest? personalInfo;
  @JsonKey(name: 'residence_info')
  final ResidenceInfoRequest? residenceInfo;
  @JsonKey(name: 'employment_info')
  final EmploymentInfo? employmentInfo;
  final List<Agreement>? agreements;
  @JsonKey(name: 'last_journey')
  final LastJourney? lastJourney;
  @JsonKey(name: 'is_staff')
  final bool isStaff;

  const GetAccountResponse(
      {required this.id,
      required this.username,
      required this.email,
      this.personalInfo,
      this.residenceInfo,
      this.employmentInfo,
      this.agreements,
      this.lastJourney,
      required this.isStaff});

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountResponseToJson(this);

  String get idStr {
    return id == 0 ? '-' : id.toString();
  }

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        personalInfo,
        residenceInfo,
        employmentInfo,
        agreements,
        lastJourney,
        isStaff
      ];
}

@JsonSerializable()
class LastJourney {
  @JsonKey(name: 'user_journey')
  final String userJourney;
  @JsonKey(name: 'data')
  final String? signature;

  LastJourney({
    this.userJourney = '',
    this.signature,
  });

  factory LastJourney.fromJson(Map<String, dynamic> json) =>
      _$LastJourneyFromJson(json);

  Map<String, dynamic> toJson() => _$LastJourneyToJson(this);

  @override
  String toString() =>
      'LastJourney(userJourney: $userJourney, signature: $signature)';
}
