// part of 'financial_profile_bloc.dart';

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
