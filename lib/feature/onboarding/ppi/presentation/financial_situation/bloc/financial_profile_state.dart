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

String fundingSourceValue(FundingSource fundingSource) {
  switch (fundingSource) {
    case FundingSource.employmentIncome:
      return 'employment_income';
    case FundingSource.investments:
      return 'investments';
    case FundingSource.inheritance:
      return 'inheritance';
    case FundingSource.businessIncome:
      return 'business_income';
    case FundingSource.savings:
      return 'savings';
    case FundingSource.family:
      return 'family';
    default:
      return 'unknown';
  }
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
  final String? occupation;
  final String? otherOccupation;
  final String? employer;
  final String? employerAddress;
  final String? employerAddressTwo;

  const FinancialProfileState({
    this.annualHouseholdIncome = '',
    this.investibleLiquidAssets = '',
    this.fundingSource = FundingSource.unknown,
    this.employmentStatus = EmploymentStatus.unknown,
    this.occupation = '',
    this.otherOccupation = '',
    this.employer = '',
    this.employerAddress = '',
    this.employerAddressTwo = '',
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
    String? employerAddressTwo,
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
      employerAddressTwo: employerAddressTwo ?? this.employerAddressTwo,
    );
  }

  @override
  List<Object> get props {
    return [
      annualHouseholdIncome,
      investibleLiquidAssets,
      fundingSource,
      employmentStatus,
      occupation ?? '',
      otherOccupation ?? '',
      employer ?? '',
      employerAddress ?? '',
      employerAddressTwo ?? '',
    ];
  }

  bool enableNextButton() {
    if (investibleLiquidAssets.isNotEmpty &&
        fundingSource != FundingSource.unknown &&
        employmentStatus != EmploymentStatus.unknown &&
        employmentStatus != EmploymentStatus.employed) {
      return true;
    } else if (employmentStatus == EmploymentStatus.employed &&
        occupation != 'Other' &&
        occupation!.isNotEmpty) {
      return true;
    } else if (occupation == 'Other' &&
        otherOccupation != null &&
        otherOccupation!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
    //
    //   if (investibleLiquidAssets.isNotEmpty) {
    //     if (EmploymentStatus.unknown == employmentStatus) {
    //       return false;
    //     } else if (EmploymentStatus.employed == employmentStatus) {
    //       if (occupation != 'Other') {
    //         if (employer != null && employerAddress != null) {
    //           return true;
    //         } else {
    //           return false;
    //         }
    //       } else {
    //         print('here');
    //         if (otherOccupation!.isNotEmpty) {
    //           return true;
    //         } else {
    //           return false;
    //         }
    //       }
    //     } else {
    //       return true;
    //     }
    //   }
    //   return false;
  }
}
