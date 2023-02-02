part of 'financial_profile_bloc.dart';

const incomeRangeItems = [
  '0 - 200,000',
  '200,001 - 400,000',
  '400,001 - 600,000',
  '600,000 - 800,000',
  '800,001 - 1,000,000+',
];

enum Occupations {
  accountant('Accountant'),
  analyst('Analyst'),
  architect('Architect'),
  attorney('Attorney'),
  auditor('Auditor'),
  businessOwner('Business Owner'),
  ceo('CEO'),
  cashier('Cashier'),
  collectionsAgent('Collections Agent'),
  complianceOfficer('Compliance Officer'),
  computerProgrammer('Computer Programmer'),
  courier('Courier'),
  customerServiceRepresentative('Customer Service Representative'),
  databaseAdministrator('Database Administrator'),
  doctor('Doctor'),
  director('Director'),
  engineer('Engineer'),
  entrepreneur('Entrepreneur'),
  executive('Executive'),
  humanResources('Human Resources'),
  insuranceAgent('Insurance Agent'),
  lawyer('Lawyer'),
  legalAssistant('Legal Assistant'),
  manager('Manager'),
  managingDirector('Managing Director'),
  nurse('Nurse'),
  paralegal('Paralegal'),
  president('President'),
  projectManager('Project Manager'),
  realEstateAgent('Real Estate Agent'),
  retail('Retail'),
  recruiter('Recruiter'),
  salesRepresentative('Sales Representative'),
  teacher('Teacher'),
  other('Other');

  final String value;

  const Occupations(this.value);
}

enum FundingSource {
  employmentIncome('Employment Income'),
  investments('Investments'),
  inheritance('Inheritance'),
  businessIncome('Business Income'),
  savings('Savings'),
  family('Family'),
  unknown('Unknown');

  final String value;

  const FundingSource(this.value);
}

enum EmploymentStatus {
  unemployed('Unemployed'),
  employed('Employed'),
  selfEmployed('Self Employed'),
  retired('Retired'),
  student('Student'),
  atHomeTrader('At-Home Trader'),
  homemaker('Homemaker'),
  unknown('Unknown');

  final String value;

  const EmploymentStatus(this.value);
}

enum NatureOfBusiness {
  architectureEngineering('Architecture / Engineering'),
  artDesign('Arts / Design'),
  businessNonFinance('Business, Non-Finance'),
  communitySocialService('Community / Social Service'),
  computerInformationTechnology('Computer / Information Technology'),
  construction('Construction'),
  educationTrainingLibrary('Education / Training / Library'),
  farmingFishingForestry('Farming, Fishing and Forestry'),
  financeBrokerDealerBank('Finance/ Broker Dealer /Bank'),
  foodBeverage('Food and Beverage'),
  healthcare('Healthcare'),
  installationMaintenanceRepair('Installation, Maintenance, and Repair'),
  legal('Legal'),
  lifePhysicalSocialService('Life, Physical and Social Service'),
  mediaCommunications('Media and Communications'),
  lawEnforcementGovernmentProtectiveService(
      'Law Enforcement, Government, Protective Service'),
  personalCareService('Personal Care / Service'),
  productionManufacturing('Production and Manufacturing'),
  transportationMaterialMoving('Transportation and Material Moving'),
  other('Other');

  final String value;

  const NatureOfBusiness(this.value);
}

enum Region {
  hongKongIsland('Hong Kong Island'),
  kowloon('Kowloon'),
  newTerritories('New Territories');

  final String value;

  const Region(this.value);
}

enum District {
  islands('Islands'),
  kwaiTsing('Kwai Tsing'),
  north('North'),
  saiKung('Sai Kung'),
  shaTin('Sha Tin'),
  taiPo('Tai Po'),
  tsuenWan('Tsuen Wan'),
  tuenMun('Tuen Mun'),
  yuenLong('Yuen Long'),
  kowloonCity('Kowloon City'),
  kwunTong('Kwun Tong'),
  shamShuiPo('Sham Shui Po'),
  wongTaiSin('Wong Tai Sin'),
  yauTsimMong('Yau Tsim Mong'),
  centralAndWestern('Central and Western'),
  eastern('Eastern'),
  southern('Southern'),
  wanChai('Wan Chai');

  final String value;

  const District(this.value);
}

class FinancialProfileState extends Equatable {
  final String annualHouseholdIncome;
  final String investibleLiquidAssets;
  final FundingSource fundingSource;
  final EmploymentStatus employmentStatus;
  final NatureOfBusiness? natureOfBusiness;
  final String? natureOfBusinessDescription;
  final Occupations? occupation;
  final String? otherOccupation;
  final String? employer;
  final String? employerAddress;
  final String? employerAddressTwo;
  final District? district;
  final Region? region;
  final String? country;
  final String? countryName;
  final String? detailInformationOfCountry;

  const FinancialProfileState(
      {this.annualHouseholdIncome = '',
      this.investibleLiquidAssets = '',
      this.fundingSource = FundingSource.unknown,
      this.employmentStatus = EmploymentStatus.unknown,
      this.natureOfBusiness,
      this.natureOfBusinessDescription = '',
      this.occupation,
      this.otherOccupation = '',
      this.employer = '',
      this.employerAddress = '',
      this.employerAddressTwo = '',
      this.district,
      this.region,
      this.country = '',
      this.countryName = '',
      this.detailInformationOfCountry = ''});

  FinancialProfileState copyWith({
    String? annualHouseholdIncome,
    String? investibleLiquidAssets,
    FundingSource? fundingSource,
    EmploymentStatus? employmentStatus,
    NatureOfBusiness? natureOfBusiness,
    String? natureOfBusinessDescription,
    Occupations? occupation,
    String? otherOccupation,
    String? employer,
    String? employerAddress,
    String? employerAddressTwo,
    District? district,
    Region? region,
    String? country,
    String? countryName,
    String? detailInformationOfCountry,
  }) {
    return FinancialProfileState(
        annualHouseholdIncome:
            annualHouseholdIncome ?? this.annualHouseholdIncome,
        investibleLiquidAssets:
            investibleLiquidAssets ?? this.investibleLiquidAssets,
        fundingSource: fundingSource ?? this.fundingSource,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        natureOfBusiness: natureOfBusiness ?? this.natureOfBusiness,
        natureOfBusinessDescription:
            natureOfBusinessDescription ?? this.natureOfBusinessDescription,
        occupation: occupation ?? this.occupation,
        otherOccupation: otherOccupation ?? this.otherOccupation,
        employer: employer ?? this.employer,
        employerAddress: employerAddress ?? this.employerAddress,
        employerAddressTwo: employerAddressTwo ?? this.employerAddressTwo,
        district: district ?? this.district,
        region: region ?? this.region,
        country: country ?? this.country,
        countryName: countryName ?? this.countryName,
        detailInformationOfCountry:
            detailInformationOfCountry ?? this.detailInformationOfCountry);
  }

  @override
  List<Object> get props {
    return [
      annualHouseholdIncome,
      investibleLiquidAssets,
      fundingSource,
      employmentStatus,
      natureOfBusiness ?? '',
      natureOfBusinessDescription ?? '',
      occupation ?? '',
      otherOccupation ?? '',
      employer ?? '',
      employerAddress ?? '',
      employerAddressTwo ?? '',
      district ?? '',
      region ?? '',
      country ?? '',
      countryName ?? '',
      detailInformationOfCountry ?? ''
    ];
  }

  bool enableNextButton() {
    if (employmentStatus != EmploymentStatus.unknown &&
        employmentStatus != EmploymentStatus.employed &&
        employmentStatus != EmploymentStatus.selfEmployed) {
      return true;
    } else if ((employmentStatus == EmploymentStatus.employed ||
            employmentStatus == EmploymentStatus.selfEmployed) &&
        natureOfBusiness != null &&
        natureOfBusiness != NatureOfBusiness.other &&
        occupation != null &&
        occupation != Occupations.other &&
        employer!.isNotEmpty &&
        employerAddress!.isNotEmpty &&
        district != null &&
        region != null &&
        country!.isNotEmpty &&
        country == 'HKG') {
      return true;
    } else if (natureOfBusiness == NatureOfBusiness.other &&
        natureOfBusinessDescription != null &&
        natureOfBusinessDescription!.isNotEmpty &&
        occupation == Occupations.other &&
        otherOccupation != null &&
        otherOccupation!.isNotEmpty &&
        country != 'HKG' &&
        detailInformationOfCountry!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
