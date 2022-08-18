import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_details/domain/get_bank_account_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_details/domain/registered_bank_accounts.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_list/domain/bank_details.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'edda/bank_details_bloc_test.mocks.dart';

void main() async {
  group('Deposit Bloc Tests', () {
    late DepositBloc depositBloc;
    late MockBankDetailsRepository mockBankDetailsRepository;
    final BaseResponse<RegisteredBankAccounts> registeredBankAccountResponse =
        BaseResponse.complete(RegisteredBankAccounts(const [
      GetBankAccountResponse('', '', '', '123', 'Alex', '112233', 'FPS', '',
          'Bank Central Asia', '', '', '')
    ]));
    final NavigationBloc<DepositPageStep> navigationBloc =
        NavigationBloc(DepositPageStep.unknown);

    setUpAll(() async {
      mockBankDetailsRepository = MockBankDetailsRepository();
    });

    setUp(() async {
      depositBloc =
          DepositBloc(bankDetailsRepository: mockBankDetailsRepository);
    });

    test('Deposit Bloc init state', () {
      expect(
          depositBloc.state,
          const DepositState(
            registeredBankAccountResponse: BaseResponse(),
          ));
    });

    blocTest<NavigationBloc<DepositPageStep>, NavigationState<DepositPageStep>>(
        'emits `depositPages` = DepositPageStep.depositMethod WHEN '
        'Trigger PageChange to deposit method screen',
        build: () {
          return navigationBloc;
        },
        act: (bloc) =>
            bloc.add(const PageChanged(DepositPageStep.depositMethod)),
        expect: () => {
              const NavigationState(
                page: DepositPageStep.depositMethod,
              ),
            });

    blocTest<DepositBloc, DepositState>(
        'emits `registeredBankAccountResponse` WHEN '
        'checking for registered bank account',
        build: () {
          when(mockBankDetailsRepository.getBankAccount())
              .thenAnswer((_) => Future.value(registeredBankAccountResponse));
          return depositBloc;
        },
        act: (bloc) => bloc.add(const RegisteredBankAccountCheck()),
        expect: () => {
              DepositState(
                  registeredBankAccountResponse: BaseResponse.loading()),
              DepositState(
                  depositEvent: const RegisteredBankAccountCheck(),
                  registeredBankAccountResponse: registeredBankAccountResponse),
              DepositState(
                  depositEvent: const RegisteredBankAccountCheck(),
                  registeredBankAccountResponse: registeredBankAccountResponse),
            });

    blocTest<DepositBloc, DepositState>(
        'emits `registeredBankAccountResponse` and depositPages = DepositPagesStep.returning WHEN '
        'select for fps deposit method on already registered bank account',
        build: () {
          when(mockBankDetailsRepository.getBankAccount())
              .thenAnswer((_) => Future.value(registeredBankAccountResponse));
          return depositBloc;
        },
        act: (bloc) async {
          bloc.add(const RegisteredBankAccountCheck());
          await Future.delayed(const Duration(seconds: 1));
          bloc.add(const DepositMethodSelected(DepositMethod.fps));
        },
        expect: () => {
              DepositState(
                  registeredBankAccountResponse: BaseResponse.loading()),
              DepositState(
                  depositEvent: const RegisteredBankAccountCheck(),
                  registeredBankAccountResponse: registeredBankAccountResponse),
              DepositState(
                  depositEvent: const RegisteredBankAccountCheck(),
                  registeredBankAccountResponse: registeredBankAccountResponse),
              DepositState(
                depositEvent: const DepositMethodSelected(DepositMethod.fps),
                depositMethod: DepositMethod.fps,
                registeredBankAccountResponse: registeredBankAccountResponse,
              ),
              DepositState(
                depositEvent: const DepositMethodSelected(DepositMethod.fps),
                depositMethod: DepositMethod.fps,
                registeredBankAccountResponse: registeredBankAccountResponse,
              ),
            });

    blocTest<DepositBloc, DepositState>(
        'emits `bankSelected` WHEN '
        'Select bank',
        build: () {
          return depositBloc;
        },
        act: (bloc) => bloc.add(const BankSelected(
              BankDetails(123, 'BCA', '', '112233'),
            )),
        expect: () => {
              const DepositState(
                  depositEvent:
                      BankSelected(BankDetails(123, 'BCA', '', '112233')),
                  bankDetails: BankDetails(123, 'BCA', '', '112233')),
            });

    tearDown(() => {depositBloc.close()});
  });
}
