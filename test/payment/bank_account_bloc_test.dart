import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/balance/deposit/utils/deposit_utils.dart';
import 'package:asklora_mobile_app/feature/payment/bloc/bank_account_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/domain/add_bank_account_request.dart';
import 'package:asklora_mobile_app/feature/payment/domain/get_bank_account_response.dart';
import 'package:asklora_mobile_app/feature/payment/repository/bank_account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bank_account_bloc_test.mocks.dart';

@GenerateMocks([BankAccountRepository])
void main() async {
  group('Deposit Bloc Tests', () {
    late BankAccountBloc bankAccountBloc;
    late MockBankAccountRepository mockBankAccountRepository;

    final BaseResponse<List<GetBankAccountResponse>>
        registeredBankAccountResponse = BaseResponse.complete([
      const GetBankAccountResponse('', '', '', '123', 'Alex', '112233', 'FPS',
          '', 'Bank Central Asia', '', '', '')
    ]);

    AddBankAccountRequest addBankAccountRequest = const AddBankAccountRequest(
        bankCodeType: 'HKD',
        bankCode: 'AFW112',
        accountName: 'Roger Johnson',
        accountNumber: '112233',
        bankTransferType: 'WIRE');
    BaseResponse<AddBankAccountRequest> response =
        BaseResponse.complete(addBankAccountRequest);

    setUpAll(() async {
      mockBankAccountRepository = MockBankAccountRepository();
    });

    setUp(() async {
      bankAccountBloc =
          BankAccountBloc(bankAccountRepository: mockBankAccountRepository);
    });

    test('Account Bloc init state', () {
      expect(
          bankAccountBloc.state,
          const BankAccountState(
            response: BaseResponse(),
          ));
    });

    blocTest<BankAccountBloc, BankAccountState>(
        'emits `registeredBankAccountResponse` WHEN '
        'checking for registered bank account',
        build: () {
          when(mockBankAccountRepository.getBankAccount())
              .thenAnswer((_) => Future.value(registeredBankAccountResponse));
          return bankAccountBloc;
        },
        act: (bloc) => bloc.add(const RegisteredBankAccountCheck()),
        expect: () => {
              BankAccountState(response: BaseResponse.loading()),
              BankAccountState(
                  response: registeredBankAccountResponse,
                  depositType: DepositType.type2),
            });

    blocTest<BankAccountBloc, BankAccountState>(
        'emits `response` = BaseResponse.loading() and BaseResponse.complete() WHEN '
        'tap continue button',
        build: () {
          when(mockBankAccountRepository.addBankAccount(
                  addBankAccountRequest: const AddBankAccountRequest(
                      bankCodeType: 'HKD',
                      bankCode: 'AFW112',
                      accountName: 'Roger Johnson',
                      accountNumber: '112233',
                      bankTransferType: 'WIRE')))
              .thenAnswer((_) => Future.value(response));
          return bankAccountBloc;
        },
        act: (bloc) => bloc.add(const BankAccountSubmitted(
            addBankAccountRequest: AddBankAccountRequest(
                bankCodeType: 'HKD',
                bankCode: 'AFW112',
                accountName: 'Roger Johnson',
                accountNumber: '112233',
                bankTransferType: 'WIRE'))),
        expect: () => {
              BankAccountState(response: BaseResponse.loading()),
              BankAccountState(
                  response: response, depositType: DepositType.firstTime)
            });

    tearDown(() => {bankAccountBloc.close()});
  });
}
