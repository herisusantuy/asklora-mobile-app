part of 'basic_information_bloc.dart';

abstract class BasicInformationEvent extends Equatable {
  const BasicInformationEvent();

  @override
  List<Object> get props => [];
}

class BasicInformationFirstNameChanged extends BasicInformationEvent {
  final String firstName;

  const BasicInformationFirstNameChanged(this.firstName) : super();

  @override
  List<Object> get props => [firstName];
}

class BasicInformationMiddleNameChanged extends BasicInformationEvent {
  final String middleName;

  const BasicInformationMiddleNameChanged(this.middleName) : super();

  @override
  List<Object> get props => [middleName];
}

class BasicInformationLastNameChanged extends BasicInformationEvent {
  final String lastName;

  const BasicInformationLastNameChanged(this.lastName) : super();

  @override
  List<Object> get props => [lastName];
}

class BasicInformationChineseNameChanged extends BasicInformationEvent {
  final String chineseName;

  const BasicInformationChineseNameChanged(this.chineseName) : super();

  @override
  List<Object> get props => [chineseName];
}

class BasicInformationGenderChanged extends BasicInformationEvent {
  final String gender;

  const BasicInformationGenderChanged(this.gender) : super();

  @override
  List<Object> get props => [gender];
}

class BasicInformationDateOfBirthChanged extends BasicInformationEvent {
  final String dateOfBirth;

  const BasicInformationDateOfBirthChanged(this.dateOfBirth) : super();

  @override
  List<Object> get props => [dateOfBirth];
}

class BasicInformationCountryCodeChanged extends BasicInformationEvent {
  final String countryCode;

  const BasicInformationCountryCodeChanged(this.countryCode) : super();

  @override
  List<Object> get props => [countryCode];
}

class BasicInformationPhoneNumberChanged extends BasicInformationEvent {
  final String phoneNumber;

  const BasicInformationPhoneNumberChanged(this.phoneNumber) : super();

  @override
  List<Object> get props => [phoneNumber];
}

class BasicInformationCountryOfCitizenshipChanged
    extends BasicInformationEvent {
  final String countryOfCitizenship;
  final String countryNameOfCitizenship;

  const BasicInformationCountryOfCitizenshipChanged(
      this.countryOfCitizenship, this.countryNameOfCitizenship)
      : super();

  @override
  List<Object> get props => [countryOfCitizenship];
}

class BasicInformationIsHongKongPermanentResidentChanged
    extends BasicInformationEvent {
  final bool isHongKongPermanentResident;

  const BasicInformationIsHongKongPermanentResidentChanged(
      this.isHongKongPermanentResident)
      : super();

  @override
  List<Object> get props => [isHongKongPermanentResident];
}

class BasicInformationIdNumberChanged extends BasicInformationEvent {
  final String idNumber;

  const BasicInformationIdNumberChanged(this.idNumber);

  @override
  List<Object> get props => [idNumber];
}

class BasicInformationIsUnitedStateResidentChanged
    extends BasicInformationEvent {
  final bool isUnitedStateResident;

  const BasicInformationIsUnitedStateResidentChanged(this.isUnitedStateResident)
      : super();

  @override
  List<Object> get props => [isUnitedStateResident];
}

class BasicInformationNext extends BasicInformationEvent {
  const BasicInformationNext() : super();

  @override
  List<Object> get props => [];
}

class BasicInformationReset extends BasicInformationEvent {
  const BasicInformationReset() : super();

  @override
  List<Object> get props => [];
}
