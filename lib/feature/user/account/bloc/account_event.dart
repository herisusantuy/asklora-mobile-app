part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetAccount extends AccountEvent {}

class UpgradeAccount extends AccountEvent {
  final UpgradeAccountRequest? upgradeAccountRequest;

  const UpgradeAccount(this.upgradeAccountRequest);
}

class GetSdkToken extends AccountEvent {}

class AccountCurrentStepChanged extends AccountEvent {
  final String type;
  const AccountCurrentStepChanged(
    this.type,
  ) : super();
  @override
  List<Object> get props => [type];
}

class AccountFirstNameChanged extends AccountEvent {
  final String firstName;
  const AccountFirstNameChanged(this.firstName) : super();
  @override
  List<Object> get props => [firstName];
}

class AccountMiddleNameChanged extends AccountEvent {
  final String middleName;
  const AccountMiddleNameChanged(this.middleName) : super();
  @override
  List<Object> get props => [middleName];
}

class AccountLastNameChanged extends AccountEvent {
  final String lastName;
  const AccountLastNameChanged(this.lastName) : super();
  @override
  List<Object> get props => [lastName];
}

class AccountChineseNameChanged extends AccountEvent {
  final String chineseName;
  const AccountChineseNameChanged(this.chineseName) : super();
  @override
  List<Object> get props => [chineseName];
}

class AccountGenderChanged extends AccountEvent {
  final String gender;
  const AccountGenderChanged(this.gender) : super();
  @override
  List<Object> get props => [gender];
}

class AccountDateOfBirthChanged extends AccountEvent {
  final String dateOfBirth;
  const AccountDateOfBirthChanged(this.dateOfBirth) : super();
  @override
  List<Object> get props => [dateOfBirth];
}

class AccountCountryCodeChanged extends AccountEvent {
  final String countryCode;
  const AccountCountryCodeChanged(this.countryCode) : super();
  @override
  List<Object> get props => [countryCode];
}

class AccountPhoneNumberChanged extends AccountEvent {
  final String phoneNumber;
  const AccountPhoneNumberChanged(this.phoneNumber) : super();
  @override
  List<Object> get props => [phoneNumber];
}

class AccountCountryOfCitizenshipChanged extends AccountEvent {
  final String countryOfCitizenship;
  const AccountCountryOfCitizenshipChanged(this.countryOfCitizenship) : super();
  @override
  List<Object> get props => [countryOfCitizenship];
}

class AccountIsHongKongPermanentResidentChanged extends AccountEvent {
  final bool isHongKongPermanentResident;
  const AccountIsHongKongPermanentResidentChanged(
      this.isHongKongPermanentResident)
      : super();
  @override
  List<Object> get props => [isHongKongPermanentResident];
}

class AccountIsUnitedStateResidentChanged extends AccountEvent {
  final bool isUnitedStateResident;
  const AccountIsUnitedStateResidentChanged(this.isUnitedStateResident)
      : super();
  @override
  List<Object> get props => [isUnitedStateResident];
}

class AccountUnitNumberChanged extends AccountEvent {
  final String unitNumber;
  const AccountUnitNumberChanged(this.unitNumber) : super();
  @override
  List<Object> get props => [unitNumber];
}

class AccountResidentialChanged extends AccountEvent {
  final String residentialAddress;
  const AccountResidentialChanged(this.residentialAddress) : super();
  @override
  List<Object> get props => [residentialAddress];
}

class AccountCityChanged extends AccountEvent {
  final String city;
  const AccountCityChanged(this.city) : super();
  @override
  List<Object> get props => [city];
}

class AccountCountryChanged extends AccountEvent {
  final String country;
  const AccountCountryChanged(this.country) : super();
  @override
  List<Object> get props => [country];
}

class AccountIsSameMailingAddressChanged extends AccountEvent {
  final bool isSameMailingAddress;
  const AccountIsSameMailingAddressChanged(this.isSameMailingAddress) : super();
  @override
  List<Object> get props => [isSameMailingAddress];
}

class AccountMailUnitNumberChanged extends AccountEvent {
  final String mailUnitNumber;
  const AccountMailUnitNumberChanged(this.mailUnitNumber) : super();
  @override
  List<Object> get props => [mailUnitNumber];
}

class AccountMailResidentialAddressChanged extends AccountEvent {
  final String mailResidentialAddress;
  const AccountMailResidentialAddressChanged(this.mailResidentialAddress)
      : super();
  @override
  List<Object> get props => [mailResidentialAddress];
}

class AccountMailCityChanged extends AccountEvent {
  final String mailCity;
  const AccountMailCityChanged(this.mailCity) : super();
  @override
  List<Object> get props => [mailCity];
}

class AccountMailCountryChanged extends AccountEvent {
  final String mailCountry;
  const AccountMailCountryChanged(this.mailCountry) : super();
  @override
  List<Object> get props => [mailCountry];
}

class AccountAnnualIncomeChanged extends AccountEvent {
  final String annualIncome;
  const AccountAnnualIncomeChanged(this.annualIncome) : super();
  @override
  List<Object> get props => [annualIncome];
}

class AccountInvestibleLiquidAssetChanged extends AccountEvent {
  final String investibleLiquidAssets;
  const AccountInvestibleLiquidAssetChanged(this.investibleLiquidAssets)
      : super();
  @override
  List<Object> get props => [investibleLiquidAssets];
}

class AccountFundingSourceChanged extends AccountEvent {
  final String fundingSource;
  const AccountFundingSourceChanged(this.fundingSource) : super();
  @override
  List<Object> get props => [fundingSource];
}

class AccountEmploymentStatusChanged extends AccountEvent {
  final String employmentStatus;
  const AccountEmploymentStatusChanged(this.employmentStatus) : super();
  @override
  List<Object> get props => [employmentStatus];
}

class AccountOccupationChanged extends AccountEvent {
  final String occupation;
  const AccountOccupationChanged(this.occupation) : super();
  @override
  List<Object> get props => [occupation];
}

class AccountEmployerChanged extends AccountEvent {
  final String employer;
  const AccountEmployerChanged(this.employer) : super();
  @override
  List<Object> get props => [employer];
}

class AccountEmployerAddressChanged extends AccountEvent {
  final String employerAddress;
  const AccountEmployerAddressChanged(this.employerAddress) : super();
  @override
  List<Object> get props => [employerAddress];
}
