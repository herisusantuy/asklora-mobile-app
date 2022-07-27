import 'package:asklora_mobile_app/feature/payment/withdrawal/withdrawal_amount/bloc/withdrawal_amount_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Withdrawal Amount Screen Bloc Tests', () {
    late WithdrawalAmountBloc withdrawalAmountBloc;

    setUp(() async {
      withdrawalAmountBloc = WithdrawalAmountBloc();
    });

    test(
        'Withdrawal Amount Bloc init state the amount = 0, estimated hkd = 0, submit button = 0',
        () {
      expect(
          withdrawalAmountBloc.state,
          const WithdrawalAmountState(
              withdrawalAmountErrorType:
                  WithdrawalAmountErrorType.belowMinAmount,
              withdrawalUSDAmount: 0,
              withdrawalHKDAmount: 0,
              withdrawalMaxAmount: 2000));
    });

    blocTest<WithdrawalAmountBloc, WithdrawalAmountState>(
        'emits `withdrawalUSDAmount` = 1 and `withdrawalHKDAmount` = 7.8476` WHEN '
        'input amount 1',
        build: () {
          return withdrawalAmountBloc;
        },
        act: (bloc) => bloc.add(const WithdrawalAmountChanged(1)),
        expect: () => {
              const WithdrawalAmountState(
                  withdrawalAmountErrorType: WithdrawalAmountErrorType.unknown,
                  withdrawalUSDAmount: 1,
                  withdrawalHKDAmount: 7.8476,
                  withdrawalMaxAmount: 2000),
            });

    blocTest<WithdrawalAmountBloc, WithdrawalAmountState>(
        'emits `withdrawalUSDAmount` = 2001 and `withdrawalHKDAmount` = 15703.0476, WHEN '
        'input amount 2001',
        build: () {
          return withdrawalAmountBloc;
        },
        act: (bloc) => bloc.add(const WithdrawalAmountChanged(2001)),
        expect: () => {
              const WithdrawalAmountState(
                  withdrawalAmountErrorType:
                      WithdrawalAmountErrorType.exceedMaxAmount,
                  withdrawalUSDAmount: 2001,
                  withdrawalHKDAmount: 15703.0476,
                  withdrawalMaxAmount: 2000),
            });

    tearDown(() => {withdrawalAmountBloc.close()});
  });
}
