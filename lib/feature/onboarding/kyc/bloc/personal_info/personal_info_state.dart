part of 'personal_info_bloc.dart';

class PersonalInfoState extends Equatable {
  const PersonalInfoState({
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.dateOfBirth = '1990-01-01',
    this.countryCodeOfBirth = '',
    this.countryNameOfBirth = '',
    this.phoneCountryCode = '',
    this.phoneNumber = '',
    this.nationalityCode = '',
    this.nationalityName = '',
    this.isHongKongPermanentResident,
    this.hkIdNumber = '',
    this.isUnitedStateResident,
    this.isHkIdValid = false,
    this.message = '',
    this.status = ResponseState.unknown,
    this.response = const BaseResponse(),
  });

  final String firstName;
  final String lastName;
  final String gender;
  final String dateOfBirth;
  final String countryCodeOfBirth;
  final String countryNameOfBirth;
  final String phoneCountryCode;
  final String phoneNumber;
  final String nationalityCode;
  final String nationalityName;
  final bool? isHongKongPermanentResident;
  final String hkIdNumber;
  final bool? isUnitedStateResident;
  final bool isHkIdValid;
  final ResponseState status;
  final String? message;
  final BaseResponse response;

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      gender,
      dateOfBirth,
      countryCodeOfBirth,
      countryNameOfBirth,
      phoneCountryCode,
      phoneNumber,
      nationalityCode,
      nationalityName,
      isHongKongPermanentResident,
      hkIdNumber,
      isUnitedStateResident,
      isHkIdValid,
      status,
      message,
      response,
    ];
  }

  PersonalInfoState copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? dateOfBirth,
    String? countryCodeOfBirth,
    String? countryNameOfBirth,
    String? phoneCountryCode,
    String? phoneNumber,
    String? nationalityCode,
    String? nationalityName,
    bool? isHongKongPermanentResident,
    String? hkIdNumber,
    bool? isUnitedStateResident,
    bool? isHkIdValid,
    ResponseState? status,
    String? message,
    BaseResponse? response,
  }) {
    return PersonalInfoState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      countryCodeOfBirth: countryCodeOfBirth ?? this.countryCodeOfBirth,
      countryNameOfBirth: countryNameOfBirth ?? this.countryNameOfBirth,
      phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      nationalityCode: nationalityCode ?? this.nationalityCode,
      nationalityName: nationalityName ?? this.nationalityName,
      isHongKongPermanentResident:
          isHongKongPermanentResident ?? this.isHongKongPermanentResident,
      hkIdNumber: hkIdNumber ?? this.hkIdNumber,
      isUnitedStateResident:
          isUnitedStateResident ?? this.isUnitedStateResident,
      isHkIdValid: isHkIdValid ?? this.isHkIdValid,
      status: status ?? this.status,
      message: message ?? this.message,
      response: response ?? this.response,
    );
  }

  bool enableNextButton() {
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        gender.isNotEmpty &&
        dateOfBirth.isNotEmpty &&
        countryCodeOfBirth.isNotEmpty &&
        phoneCountryCode.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        nationalityCode.isNotEmpty &&
        isHongKongPermanentResident != null &&
        isUnitedStateResident != null) {
      if (isHongKongPermanentResident == true) {
        if (hkIdNumber.isNotEmpty && isHkIdValid) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}
