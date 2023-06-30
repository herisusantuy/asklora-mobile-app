import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/edda/bloc/amount/amount_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/UtilTest/amount_error_type.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Deposit eDDA Amount Screen Bloc Tests', () {
    late AmountBloc amountBloc;

    setUp(() async {
      amountBloc = AmountBloc();
    });

    test(
        'Deposit Amount Bloc init state the depositHKDAmount = 0 `depositAmountErrorType` = belowMinAmount, response = ResponState.unknown,',
        () {
      expect(
          amountBloc.state,
          const AmountState(
              depositAmountErrorType: AmountErrorType.belowMinAmount,
              depositHKDAmount: 0,
              depositHKDMinAmount: 10000,
              response: ResponseState.unknown));
    });

    blocTest<AmountBloc, AmountState>(
        'emits `depositHKDAmount` = 1 `depositAmountErrorType` = belowMinAmount, response = ResponState.unknown, WHEN '
        'input amount 1',
        build: () {
          return amountBloc;
        },
        act: (bloc) => bloc.add(const AmountChanged(1)),
        expect: () => {
              const AmountState(
                  depositAmountErrorType: AmountErrorType.belowMinAmount,
                  depositHKDAmount: 1,
                  depositHKDMinAmount: 10000,
                  response: ResponseState.unknown),
            });

    blocTest<AmountBloc, AmountState>(
        'emits `depositHKDAmount` = 10001 `depositAmountErrorType` = unknown, response = ResponState.unknown, WHEN '
        'input amount 10001',
        build: () {
          return amountBloc;
        },
        act: (bloc) => bloc.add(const AmountChanged(10001)),
        expect: () => {
              const AmountState(
                  depositAmountErrorType: AmountErrorType.unknown,
                  depositHKDAmount: 10001,
                  depositHKDMinAmount: 10000,
                  response: ResponseState.unknown),
            });

    blocTest<AmountBloc, AmountState>(
        'emits `depositHKDAmount` = 10001, `depositAmountErrorType` = unknown, response = ResponState.loading, WHEN '
        'input amount 10001 and submit',
        build: () {
          return amountBloc;
        },
        act: (bloc) async {
          bloc.add(const AmountChanged(10001));
          bloc.add(const AmountSubmitted());
          await Future.delayed(const Duration(seconds: 3));
        },
        expect: () => {
              const AmountState(
                  depositAmountErrorType: AmountErrorType.unknown,
                  depositHKDAmount: 10001,
                  depositHKDMinAmount: 10000,
                  response: ResponseState.unknown),
              const AmountState(
                  depositAmountErrorType: AmountErrorType.unknown,
                  depositHKDAmount: 10001,
                  depositHKDMinAmount: 10000,
                  response: ResponseState.loading),
              const AmountState(
                  depositAmountErrorType: AmountErrorType.unknown,
                  depositHKDAmount: 10001,
                  depositHKDMinAmount: 10000,
                  response: ResponseState.success),
            });

    tearDown(() => {amountBloc.close()});
  });
}
