import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/balance/withdrawal/bloc/withdrawal_bloc.dart';
import 'package:asklora_mobile_app/feature/balance/withdrawal/domain/withdrawal_request.dart';
import 'package:asklora_mobile_app/feature/balance/withdrawal/domain/withdrawal_response.dart';
import 'package:asklora_mobile_app/feature/balance/withdrawal/repository/withdrawal_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'withdrawal_bloc_test.mocks.dart';

@GenerateMocks([WithdrawalRepository])
void main() async {
  group('Withdrawal Bloc Tests', () {
    late WithdrawalBloc withdrawalBloc;
    late WithdrawalRepository withdrawalRepository;
    final BaseResponse<WithdrawalResponse> submitResponse =
        BaseResponse.complete(const WithdrawalResponse('', ''));

    setUpAll(() async {
      withdrawalRepository = MockWithdrawalRepository();
    });
    setUp(() async {
      withdrawalBloc = WithdrawalBloc(
        withdrawalRepository: withdrawalRepository,
      );
    });

    test('Withdrawal Bloc init state should be default one', () {
      expect(withdrawalBloc.state, const WithdrawalState());
    });

    blocTest<WithdrawalBloc, WithdrawalState>(
        'emits `withdrawalAmount = 2000` WHEN '
        'changed withdraw amount to 2000',
        build: () => withdrawalBloc,
        act: (bloc) => bloc.add(const WithdrawalAmountChanged(2000)),
        expect: () => {
              const WithdrawalState(withdrawalAmount: 2000),
            });

    blocTest<WithdrawalBloc, WithdrawalState>(
        'emits `BaseResponse.success` WHEN '
        'submit withdrawal',
        build: () {
          when(withdrawalRepository.submitWithdrawal(
                  withdrawalRequest: const WithdrawalRequest(amount: '2000.0')))
              .thenAnswer((_) => Future.value(submitResponse));
          return withdrawalBloc;
        },
        act: (bloc) => {
              bloc.add(const WithdrawalAmountChanged(2000.0)),
              bloc.add(const SubmitWithdrawal(2000.0))
            },
        expect: () => {
              const WithdrawalState(withdrawalAmount: 2000.0),
              WithdrawalState(
                response: BaseResponse.loading(),
                withdrawalAmount: 2000.0,
              ),
              WithdrawalState(
                response: submitResponse,
                withdrawalAmount: 2000.0,
              ),
            });

    tearDown(() => {withdrawalBloc.close()});
  });
}
