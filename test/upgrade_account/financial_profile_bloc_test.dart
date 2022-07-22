import 'package:asklora_mobile_app/feature/user/account/bloc/financial_profile/bloc/financial_profile_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Financial Profile Bloc test', () {
    late FinancialProfileBloc financialProfileBloc;
    setUp(() async {
      financialProfileBloc = FinancialProfileBloc();
    });

    test(
        'init state all fields should be an empty string except for funding source and employment status, those fields should be "unknown"',
        () {
      expect(
        financialProfileBloc.state,
        const FinancialProfileState(
            annualHouseholdIncome: '',
            investibleLiquidAssets: '',
            fundingSource: FundingSource.unknown,
            employmentStatus: EmploymentStatus.unknown,
            occupation: '',
            otherOccupation: '',
            employer: '',
            employerAddress: ''),
      );
    });

    blocTest<FinancialProfileBloc, FinancialProfileState>(
      'Input field for Financial Profile form.',
      build: () => financialProfileBloc,
      act: (bloc) {
        bloc.add(
            const FinancialProfileAnnualHouseholdIncomeChanged('0 to 200,000'));
        bloc.add(
            const FinancialProfileInvestibleLiquidAssetChanged('0 to 200,000'));
        bloc.add(const FinancialProfileFundingSourceChanged(
            FundingSource.employmentIncome));
        bloc.add(const FinancialProfileEmploymentStatusChanged(
            EmploymentStatus.employed));
        bloc.add(const FinancialProfileOccupationChanged('Business'));
        bloc.add(const FinancialProfileOtherOccupationChanged('Other'));
        bloc.add(const FinancialProfileEmployerChanged('John Doe'));
        bloc.add(
            const FinancialProfileEmployerAddressChanged('20 N San Mateo Dr'));
      },
      expect: () => {
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '',
            fundingSource: FundingSource.unknown,
            employmentStatus: EmploymentStatus.unknown,
            occupation: '',
            otherOccupation: '',
            employer: '',
            employerAddress: ''),
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '0 to 200,000',
            fundingSource: FundingSource.unknown,
            employmentStatus: EmploymentStatus.unknown,
            occupation: '',
            otherOccupation: '',
            employer: '',
            employerAddress: ''),
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '0 to 200,000',
            fundingSource: FundingSource.employmentIncome,
            employmentStatus: EmploymentStatus.unknown,
            occupation: '',
            otherOccupation: '',
            employer: '',
            employerAddress: ''),
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '0 to 200,000',
            fundingSource: FundingSource.employmentIncome,
            employmentStatus: EmploymentStatus.employed,
            occupation: '',
            otherOccupation: '',
            employer: '',
            employerAddress: ''),
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '0 to 200,000',
            fundingSource: FundingSource.employmentIncome,
            employmentStatus: EmploymentStatus.employed,
            occupation: 'Business',
            otherOccupation: '',
            employer: '',
            employerAddress: ''),
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '0 to 200,000',
            fundingSource: FundingSource.employmentIncome,
            employmentStatus: EmploymentStatus.employed,
            occupation: 'Business',
            otherOccupation: 'Other',
            employer: '',
            employerAddress: ''),
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '0 to 200,000',
            fundingSource: FundingSource.employmentIncome,
            employmentStatus: EmploymentStatus.employed,
            occupation: 'Business',
            otherOccupation: 'Other',
            employer: 'John Doe',
            employerAddress: ''),
        const FinancialProfileState(
            annualHouseholdIncome: '0 to 200,000',
            investibleLiquidAssets: '0 to 200,000',
            fundingSource: FundingSource.employmentIncome,
            employmentStatus: EmploymentStatus.employed,
            occupation: 'Business',
            otherOccupation: 'Other',
            employer: 'John Doe',
            employerAddress: '20 N San Mateo Dr'),
      },
    );
  });
}
