part of 'account_bloc.dart';

enum GetAccountStatus {
  success,
  failure,
  unknown,
  fetchingAccount,
  upgradingAccount,
  fetchingOnfidoToken,
  submittingOnfidoResult,
}

enum Gender { femail, male, other, unknown }

enum FundingSource {
  employmentIncome,
  investments,
  inheritance,
  bussinessIncome,
  savings,
  family,
  unknown
}

enum EmploymentStatus {
  unemployed,
  employed,
  student,
  retired,
  unknown,
}

class AccountState extends Equatable {
  const AccountState({
    this.status = GetAccountStatus.unknown,
    this.responseMessage = '',
    this.account,
    this.upgradeAccountRequest,
    this.currentStepIndex = 0,
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.chineseName = '',
    this.gender = '',
    this.dateOfBirth = '1990-01-01',
    this.countryCode = '',
    this.phoneNumber = '',
    this.countryOfCitizenship = '',
    this.isHongkongPermanentResident = true,
    this.isUnitedStateResident = false,
    this.unitNumber = '',
    this.residentialAddress = '',
    this.city = '',
    this.country = '',
    this.isSameMailingAddress = true,
    this.mailUnitNumber = '',
    this.mailResidentialAddress = '',
    this.mailCity = '',
    this.mailCountry = '',
    this.annualHouseholdIncome = '',
    this.investibleLiquidAssets = '',
    this.fundingSource = FundingSource.unknown,
    this.employmentStatus = EmploymentStatus.unknown,
    this.occupation = '',
    this.employer = '',
    this.employerAddress = '',
  });

  final GetAccountStatus status;
  final String responseMessage;
  final GetAccountResponse? account;
  final UpgradeAccountRequest? upgradeAccountRequest;
  final int currentStepIndex;
  final String firstName;
  final String middleName;
  final String lastName;
  final String chineseName;
  final String gender;
  final String dateOfBirth;
  final String countryCode;
  final String phoneNumber;
  final String countryOfCitizenship;
  final bool isHongkongPermanentResident;
  final bool isUnitedStateResident;
  final String unitNumber;
  final String residentialAddress;
  final String city;
  final String country;
  final bool isSameMailingAddress;
  final String mailUnitNumber;
  final String mailResidentialAddress;
  final String mailCity;
  final String mailCountry;
  final String annualHouseholdIncome;
  final String investibleLiquidAssets;
  final FundingSource fundingSource;
  final EmploymentStatus employmentStatus;
  final String occupation;
  final String employer;
  final String employerAddress;

  @override
  List<Object?> get props {
    return [
      status,
      responseMessage,
      account,
      upgradeAccountRequest,
      currentStepIndex,
      firstName,
      middleName,
      lastName,
      chineseName,
      gender,
      dateOfBirth,
      countryCode,
      phoneNumber,
      countryOfCitizenship,
      isHongkongPermanentResident,
      isUnitedStateResident,
      unitNumber,
      residentialAddress,
      city,
      country,
      isSameMailingAddress,
      mailUnitNumber,
      mailResidentialAddress,
      mailCity,
      mailCountry,
      annualHouseholdIncome,
      investibleLiquidAssets,
      fundingSource,
      employmentStatus,
      occupation,
      employer,
      employerAddress
    ];
  }

  AccountState copyWith({
    GetAccountStatus? status,
    String? responseMessage,
    GetAccountResponse? account,
    UpgradeAccountRequest? upgradeAccountRequest,
    int? currentStepIndex,
    String? firstName,
    String? middleName,
    String? lastName,
    String? chineseName,
    String? gender,
    String? dateOfBirth,
    String? countryCode,
    String? phoneNumber,
    String? countryOfCitizenship,
    bool? isHongkongPermanentResident,
    bool? isUnitedStateResident,
    String? unitNumber,
    String? residentialAddress,
    String? city,
    String? country,
    bool? isSameMailingAddress,
    String? mailUnitNumber,
    String? mailResidentialAddress,
    String? mailCity,
    String? mailCountry,
    String? annualHouseholdIncome,
    String? investibleLiquidAssets,
    FundingSource? fundingSource,
    EmploymentStatus? employmentStatus,
    String? occupation,
    String? employer,
    String? employerAddress,
  }) {
    return AccountState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
      account: account ?? this.account,
      upgradeAccountRequest:
          upgradeAccountRequest ?? this.upgradeAccountRequest,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      chineseName: chineseName ?? this.chineseName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryOfCitizenship: countryOfCitizenship ?? this.countryOfCitizenship,
      isHongkongPermanentResident:
          isHongkongPermanentResident ?? this.isHongkongPermanentResident,
      isUnitedStateResident:
          isUnitedStateResident ?? this.isUnitedStateResident,
      unitNumber: unitNumber ?? this.unitNumber,
      residentialAddress: residentialAddress ?? this.residentialAddress,
      city: city ?? this.city,
      country: country ?? this.country,
      isSameMailingAddress: isSameMailingAddress ?? this.isSameMailingAddress,
      mailUnitNumber: mailUnitNumber ?? this.mailUnitNumber,
      mailResidentialAddress:
          mailResidentialAddress ?? this.mailResidentialAddress,
      mailCity: mailCity ?? this.mailCity,
      mailCountry: mailCountry ?? this.mailCountry,
      annualHouseholdIncome:
          annualHouseholdIncome ?? this.annualHouseholdIncome,
      investibleLiquidAssets:
          investibleLiquidAssets ?? this.investibleLiquidAssets,
      fundingSource: fundingSource ?? this.fundingSource,
      employmentStatus: employmentStatus ?? this.employmentStatus,
      occupation: occupation ?? this.occupation,
      employer: employer ?? this.employer,
      employerAddress: employerAddress ?? this.employerAddress,
    );
  }
}

class OnfidoSdkToken extends AccountState {
  final String token;

  const OnfidoSdkToken(this.token);
}

class OnfidoResultUpdated extends AccountState {
  final OnfidoResultResponse response;

  const OnfidoResultUpdated(this.response);
}
