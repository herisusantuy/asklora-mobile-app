import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/repository/bank_details_repository.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_details/bloc/bank_details_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_details/domain/add_bank_account_request.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../select_bank/select_bank_bloc_test.mocks.dart';

@GenerateMocks([BankDetailsRepository])
void main() async {
  group('Deposit Edda Your Bank Details Bloc Tests', () {
    late BankDetailsBloc bankDetailsBloc;
    late MockBankDetailsRepository mockBankDetailsRepository;

    AddBankAccountRequest addBankAccountRequest = const AddBankAccountRequest(
        bankCodeType: 'HKD',
        bankCode: 'AFW112',
        accountName: 'Roger Johnson',
        accountNumber: '112233',
        bankTransferType: 'WIRE');
    BaseResponse<AddBankAccountRequest> response =
        BaseResponse.complete(addBankAccountRequest);

    setUpAll(() async {
      mockBankDetailsRepository = MockBankDetailsRepository();
    });

    setUp(() async {
      bankDetailsBloc =
          BankDetailsBloc(bankDetailsRepository: mockBankDetailsRepository);
    });

    test(
        'Deposit Edda Your Bank Details Bloc init state the documentFile = null',
        () {
      expect(
          bankDetailsBloc.state,
          const BankDetailsState(
              bankAccountNumber: '',
              confirmBankAccountNumber: '',
              response: BaseResponse()));
    });

    blocTest<BankDetailsBloc, BankDetailsState>(
        'emits `bankAccountNumber` = `123` WHEN '
        'input bank account number = 123',
        build: () => bankDetailsBloc,
        act: (bloc) => bloc.add(const BankAccountNumberChanged('123')),
        expect: () => {
              BankDetailsState(
                  bankAccountNumber: '123', response: BaseResponse.unknown())
            });

    blocTest<BankDetailsBloc, BankDetailsState>(
        'emits `response` = BaseResponse.loading() and BaseResponse.complete() WHEN '
        'tap continue button',
        build: () {
          when(mockBankDetailsRepository.addBankAccount(
                  addBankAccountRequest: const AddBankAccountRequest(
                      bankCodeType: 'HKD',
                      bankCode: 'AFW112',
                      accountName: 'Roger Johnson',
                      accountNumber: '112233',
                      bankTransferType: 'WIRE')))
              .thenAnswer((_) => Future.value(response));
          return bankDetailsBloc;
        },
        act: (bloc) => bloc.add(const BankDetailsSubmitted(
            addBankAccountRequest: AddBankAccountRequest(
                bankCodeType: 'HKD',
                bankCode: 'AFW112',
                accountName: 'Roger Johnson',
                accountNumber: '112233',
                bankTransferType: 'WIRE'))),
        expect: () => {
              BankDetailsState(
                  bankAccountNumber: '', response: BaseResponse.loading()),
              BankDetailsState(bankAccountNumber: '', response: response)
            });

    tearDown(() => {bankDetailsBloc.close()});
  });
}
