import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/bloc/withdrawal_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/domain/withdrawal_request.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/domain/withdrawal_response.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/repository/withdrawal_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'withdrawal_bloc_test.mocks.dart';

@GenerateMocks([WithdrawalRepository])
void main() async {
  group('Withdrawal Bloc Tests', () {
    late WithdrawalBloc withdrawalBloc;
    late WithdrawalRepository mockWithdrawalRepository;

    setUpAll(() async {
      mockWithdrawalRepository = MockWithdrawalRepository();
    });

    setUp(() async {
      withdrawalBloc =
          WithdrawalBloc(withdrawalRepository: mockWithdrawalRepository);
    });

    test('Withdrawal Bloc init state', () {
      expect(withdrawalBloc.state, const WithdrawalState());
    });

    blocTest<WithdrawalBloc, WithdrawalState>(
        'emits `WithdrawalResponse` WHEN '
        'submit withdrawal',
        build: () {
          when(mockWithdrawalRepository.submitWithdrawal(
                  withdrawalRequest: const WithdrawalRequest(amount: '2000')))
              .thenAnswer((_) => Future.value(
                  BaseResponse.complete(const WithdrawalResponse('succeed'))));
          return withdrawalBloc;
        },
        act: (bloc) => bloc.add(const WithdrawalSubmitted('2000')),
        expect: () => {
              WithdrawalState(response: BaseResponse.loading()),
              WithdrawalState(
                  response: BaseResponse.complete(
                      const WithdrawalResponse('succeed'))),
            });

    tearDown(() => {withdrawalBloc.close()});
  });
}
