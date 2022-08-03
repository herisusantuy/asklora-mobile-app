import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/deposit/deposit_edda_your_bank_details/bloc/deposit_edda_your_bank_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Deposit Edda Your Bank Details Bloc Tests', () {
    late DepositEddaYourBankDetailsBloc depositEddaYourBankDetailsBloc;

    setUp(() async {
      depositEddaYourBankDetailsBloc = DepositEddaYourBankDetailsBloc();
    });

    test(
        'Deposit Edda Your Bank Details Bloc init state the documentFile = null',
        () {
      expect(
          depositEddaYourBankDetailsBloc.state,
          DepositEddaYourBankDetailsState(
              bankAccountNumber: '', response: BaseResponse.unknown()));
    });

    blocTest<DepositEddaYourBankDetailsBloc, DepositEddaYourBankDetailsState>(
        'emits `bankAccountNumber` = `123` WHEN '
        'input bank account number = 123',
        build: () => depositEddaYourBankDetailsBloc,
        act: (bloc) => bloc.add(const BankAccountNumberChanged('123')),
        expect: () => {
              DepositEddaYourBankDetailsState(
                  bankAccountNumber: '123', response: BaseResponse.unknown())
            });

    blocTest<DepositEddaYourBankDetailsBloc, DepositEddaYourBankDetailsState>(
        'emits `response` = BaseResponse.loading() WHEN '
        'tap continue button',
        build: () => depositEddaYourBankDetailsBloc,
        act: (bloc) => bloc.add(const YourBankDetailsSubmitted()),
        expect: () => {
              DepositEddaYourBankDetailsState(
                  bankAccountNumber: '', response: BaseResponse.loading())
            });

    tearDown(() => {depositEddaYourBankDetailsBloc.close()});
  });
}
