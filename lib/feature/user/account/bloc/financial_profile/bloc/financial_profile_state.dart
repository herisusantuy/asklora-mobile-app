part of 'financial_profile_bloc.dart';

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

class FinancialProfileState extends Equatable {
  final String annualHouseholdIncome;
  final String investibleLiquidAssets;
  final FundingSource fundingSource;
  final EmploymentStatus employmentStatus;
  final String occupation;
  final String employer;
  final String employerAddress;
  const FinancialProfileState({
    this.annualHouseholdIncome = '',
    this.investibleLiquidAssets = '',
    this.fundingSource = FundingSource.unknown,
    this.employmentStatus = EmploymentStatus.unknown,
    this.occupation = '',
    this.employer = '',
    this.employerAddress = '',
  });

  FinancialProfileState copyWith({
    String? annualHouseholdIncome,
    String? investibleLiquidAssets,
    FundingSource? fundingSource,
    EmploymentStatus? employmentStatus,
    String? occupation,
    String? employer,
    String? employerAddress,
  }) {
    return FinancialProfileState(
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

  @override
  List<Object> get props {
    return [
      annualHouseholdIncome,
      investibleLiquidAssets,
      fundingSource,
      employmentStatus,
      occupation,
      employer,
      employerAddress,
    ];
  }
}
