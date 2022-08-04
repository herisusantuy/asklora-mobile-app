import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/edda/bloc/bank_details/bank_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Deposit Edda Your Bank Details Bloc Tests', () {
    late BankDetailsBloc bankDetailsBloc;

    setUp(() async {
      bankDetailsBloc = BankDetailsBloc();
    });

    test(
        'Deposit Edda Your Bank Details Bloc init state the documentFile = null',
        () {
      expect(
          bankDetailsBloc.state,
          BankDetailsState(
              bankAccountNumber: '', response: BaseResponse.unknown()));
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
        'emits `response` = BaseResponse.loading() WHEN '
        'tap continue button',
        build: () => bankDetailsBloc,
        act: (bloc) => bloc.add(const BankDetailsSubmitted()),
        expect: () => {
              BankDetailsState(
                  bankAccountNumber: '', response: BaseResponse.loading())
            });

    tearDown(() => {bankDetailsBloc.close()});
  });
}
