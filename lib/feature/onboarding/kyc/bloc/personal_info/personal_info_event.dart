part of 'personal_info_bloc.dart';

abstract class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();

  @override
  List<Object> get props => [];
}

class BasicInformationFirstNameChanged extends PersonalInfoEvent {
  final String firstName;

  const BasicInformationFirstNameChanged(this.firstName) : super();

  @override
  List<Object> get props => [firstName];
}

class BasicInformationMiddleNameChanged extends PersonalInfoEvent {
  final String middleName;

  const BasicInformationMiddleNameChanged(this.middleName) : super();

  @override
  List<Object> get props => [middleName];
}

class BasicInformationLastNameChanged extends PersonalInfoEvent {
  final String lastName;

  const BasicInformationLastNameChanged(this.lastName) : super();

  @override
  List<Object> get props => [lastName];
}

class BasicInformationChineseNameChanged extends PersonalInfoEvent {
  final String chineseName;

  const BasicInformationChineseNameChanged(this.chineseName) : super();

  @override
  List<Object> get props => [chineseName];
}

class BasicInformationGenderChanged extends PersonalInfoEvent {
  final String gender;

  const BasicInformationGenderChanged(this.gender) : super();

  @override
  List<Object> get props => [gender];
}

class BasicInformationDateOfBirthChanged extends PersonalInfoEvent {
  final String dateOfBirth;

  const BasicInformationDateOfBirthChanged(this.dateOfBirth) : super();

  @override
  List<Object> get props => [dateOfBirth];
}

class BasicInformationCountryCodeChanged extends PersonalInfoEvent {
  final String countryCode;

  const BasicInformationCountryCodeChanged(this.countryCode) : super();

  @override
  List<Object> get props => [countryCode];
}

class BasicInformationPhoneNumberChanged extends PersonalInfoEvent {
  final String phoneNumber;

  const BasicInformationPhoneNumberChanged(this.phoneNumber) : super();

  @override
  List<Object> get props => [phoneNumber];
}

class BasicInformationCountryOfCitizenshipChanged extends PersonalInfoEvent {
  final String countryOfCitizenship;
  final String countryNameOfCitizenship;

  const BasicInformationCountryOfCitizenshipChanged(
      this.countryOfCitizenship, this.countryNameOfCitizenship)
      : super();

  @override
  List<Object> get props => [countryOfCitizenship];
}

class BasicInformationCountryOfBirthChanged extends PersonalInfoEvent {
  final String countryCodeOfBirth;
  final String countryNameOfBirth;

  const BasicInformationCountryOfBirthChanged(
      this.countryCodeOfBirth, this.countryNameOfBirth)
      : super();

  @override
  List<Object> get props => [countryCodeOfBirth];
}

class BasicInformationIsHongKongPermanentResidentChanged
    extends PersonalInfoEvent {
  final bool isHongKongPermanentResident;

  const BasicInformationIsHongKongPermanentResidentChanged(
      this.isHongKongPermanentResident)
      : super();

  @override
  List<Object> get props => [isHongKongPermanentResident];
}

class BasicInformationIdNumberChanged extends PersonalInfoEvent {
  final String idNumber;

  const BasicInformationIdNumberChanged(this.idNumber);

  @override
  List<Object> get props => [idNumber];
}

class BasicInformationIsUnitedStateResidentChanged extends PersonalInfoEvent {
  final bool isUnitedStateResident;

  const BasicInformationIsUnitedStateResidentChanged(this.isUnitedStateResident)
      : super();

  @override
  List<Object> get props => [isUnitedStateResident];
}

class BasicInformationNext extends PersonalInfoEvent {
  const BasicInformationNext() : super();

  @override
  List<Object> get props => [];
}

class BasicInformationReset extends PersonalInfoEvent {
  const BasicInformationReset() : super();

  @override
  List<Object> get props => [];
}

class BasicInformationSubmitted extends PersonalInfoEvent {
  const BasicInformationSubmitted() : super();
  @override
  List<Object> get props => [];
}
