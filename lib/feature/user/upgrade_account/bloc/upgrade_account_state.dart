part of 'upgrade_account_bloc.dart';

enum Gender { female, male, unknown }

class UpgradeAccountState extends Equatable {
  final BaseResponse response;
  final String firstName;
  final String middleName;
  final String lastName;
  final String chineseName;
  final Gender gender;
  final String dateOfBirth;
  final String countryCode;
  final String phoneNumber;
  final String countryOfCitizenship;
  final bool isHongKongResident;
  final bool isUnitedStateResident;

  const UpgradeAccountState({
    this.response = const BaseResponse(),
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.chineseName = '',
    this.gender = Gender.unknown,
    this.dateOfBirth = '',
    this.countryCode = '',
    this.phoneNumber = '',
    this.countryOfCitizenship = '',
    this.isHongKongResident = true,
    this.isUnitedStateResident = false,
  }) : super();

  @override
  List<Object> get props {
    return [
      response,
      firstName,
      middleName,
      lastName,
      chineseName,
      gender,
      dateOfBirth,
      countryCode,
      phoneNumber,
      countryOfCitizenship,
      isHongKongResident,
      isUnitedStateResident,
    ];
  }

  UpgradeAccountState copyWith({
    BaseResponse? response,
    String? firstName,
    String? middleName,
    String? lastName,
    String? chineseName,
    Gender? gender,
    String? dateOfBirth,
    String? countryCode,
    String? phoneNumber,
    String? countryOfCitizenship,
    bool? isHongKongResident,
    bool? isUnitedStateResident,
  }) {
    return UpgradeAccountState(
      response: response ?? this.response,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      chineseName: chineseName ?? this.chineseName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryOfCitizenship: countryOfCitizenship ?? this.countryOfCitizenship,
      isHongKongResident: isHongKongResident ?? this.isHongKongResident,
      isUnitedStateResident:
          isUnitedStateResident ?? this.isUnitedStateResident,
    );
  }
}
