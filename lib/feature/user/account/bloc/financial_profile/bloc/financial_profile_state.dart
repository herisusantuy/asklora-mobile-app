part of 'financial_profile_bloc.dart';

enum FundingSource {
  employmentIncome,
  investments,
  inheritance,
  businessIncome,
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
  final String otherOccupation;
  final String employer;
  final String employerAddress;

  const FinancialProfileState({
    this.annualHouseholdIncome = '',
    this.investibleLiquidAssets = '',
    this.fundingSource = FundingSource.unknown,
    this.employmentStatus = EmploymentStatus.unknown,
    this.occupation = '',
    this.otherOccupation = '',
    this.employer = '',
    this.employerAddress = '',
  });

  FinancialProfileState copyWith({
    String? annualHouseholdIncome,
    String? investibleLiquidAssets,
    FundingSource? fundingSource,
    EmploymentStatus? employmentStatus,
    String? occupation,
    String? otherOccupation,
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
      otherOccupation: otherOccupation ?? this.otherOccupation,
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
      otherOccupation,
      employer,
      employerAddress,
    ];
  }

  bool enableNextButton() {
    if (annualHouseholdIncome.isNotEmpty && investibleLiquidAssets.isNotEmpty) {
      if (EmploymentStatus.unknown == employmentStatus) {
        return false;
      } else if (EmploymentStatus.employed == employmentStatus) {
        if (occupation != 'Other') {
          if (employer.isNotEmpty && employerAddress.isNotEmpty) {
            return true;
          } else {
            return false;
          }
        } else {
          if (otherOccupation.isNotEmpty) {
            return true;
          } else {
            return false;
          }
        }
      } else {
        return true;
      }
    }
    return false;
  }
}
