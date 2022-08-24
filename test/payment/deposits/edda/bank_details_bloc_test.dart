import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_details/bloc/bank_details_bloc.dart';
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
          const BankDetailsState(
              bankAccountNumber: '', confirmBankAccountNumber: ''));
    });

    blocTest<BankDetailsBloc, BankDetailsState>(
        'emits `bankAccountNumber` = `123` WHEN '
        'input bank account number = 123',
        build: () => bankDetailsBloc,
        act: (bloc) => bloc.add(const BankAccountNumberChanged('123')),
        expect: () => {const BankDetailsState(bankAccountNumber: '123')});

    tearDown(() => {bankDetailsBloc.close()});
  });
}
