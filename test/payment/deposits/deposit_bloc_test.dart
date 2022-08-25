import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_list/domain/bank_details.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Deposit Bloc Tests', () {
    late DepositBloc depositBloc;

    setUp(() async {
      depositBloc = DepositBloc();
    });

    test('Deposit Bloc init state', () {
      expect(depositBloc.state, const DepositState());
    });

    blocTest<DepositBloc, DepositState>(
        'emits `registeredBankAccountResponse` and depositPages = DepositPagesStep.returning WHEN '
        'select for fps deposit method',
        build: () => depositBloc,
        act: (bloc) async =>
            bloc.add(const DepositMethodSelected(DepositMethod.fps)),
        expect: () => {
              const DepositState(
                depositEvent: DepositMethodSelected(DepositMethod.fps),
                depositMethod: DepositMethod.fps,
              ),
            });

    blocTest<DepositBloc, DepositState>(
        'emits `bankSelected` WHEN '
        'Select bank',
        build: () {
          return depositBloc;
        },
        act: (bloc) => bloc.add(
            const BankSelected(BankDetails(123, 'BCA', '', '112233'), 111)),
        expect: () => {
              const DepositState(
                  depositEvent:
                      BankSelected(BankDetails(123, 'BCA', '', '112233'), 111),
                  bankDetails: BankDetails(123, 'BCA', '', '112233'))
            });

    tearDown(() => {depositBloc.close()});
  });
}
