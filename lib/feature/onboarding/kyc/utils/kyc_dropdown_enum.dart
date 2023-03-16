import 'package:collection/collection.dart';

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

  static Occupations? findByString(String occupation) => Occupations.values
      .firstWhereOrNull((element) => element.value == occupation);
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
  unemployed('Unemployed', 'UNEMPLOYED'),
  employed('Employed', 'EMPLOYED'),
  selfEmployed('Self Employed', 'SELFEMPLOYED'),
  retired('Retired', 'RETIRED'),
  student('Student', 'STUDENT'),
  atHomeTrader('At-Home Trader', 'ATHOMETRADER'),
  homemaker('Homemaker', 'HOMEMAKER'),
  unknown('Unknown', 'UNKNOWN');

  final String name;
  final String value;

  const EmploymentStatus(this.name, this.value);

  static EmploymentStatus? findByStringValue(String employmentStatus) =>
      EmploymentStatus.values
          .firstWhereOrNull((element) => element.value == employmentStatus);
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

  static NatureOfBusiness? findByString(String natureOfBusiness) =>
      NatureOfBusiness.values
          .firstWhereOrNull((element) => element.value == natureOfBusiness);
}

enum Region {
  hongKongIsland('Hong Kong Island'),
  kowloon('Kowloon'),
  newTerritories('New Territories');

  final String value;

  const Region(this.value);

  static Region? findByString(String region) =>
      Region.values.firstWhereOrNull((element) => element.value == region);
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

  static District? findByString(String district) =>
      District.values.firstWhereOrNull((element) => element.value == district);
}
