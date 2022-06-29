import 'package:asklora_mobile_app/feature/user/get_account/bloc/get_account_bloc.dart';
import 'package:asklora_mobile_app/feature/user/get_account/domain/get_account_api_client.dart';
import 'package:asklora_mobile_app/feature/user/get_account/domain/get_account_response.dart';
import 'package:asklora_mobile_app/feature/user/get_account/domain/trade_requirements_status.dart';
import 'package:asklora_mobile_app/feature/user/get_account/repository/get_account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_account_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockGetAccountBloc extends MockBloc<GetAccountEvent, GetAccountState>
    implements GetAccountBloc {}

@GenerateMocks([GetAccountRepository])
@GenerateMocks([GetAccountApiClient])
void main() {
  group(
    'Get account Bloc test',
    () {
      late MockGetAccountRepository getAccountRepository;
      late GetAccountBloc getAccountBloc;
      final tradeRequirementStatus = TradeRequirementsStatus(
        false,
        false,
        false,
        false,
        false,
      );
      final GetAccountResponse account = GetAccountResponse(
        'asklora@loratech.ai.com',
        tradeRequirementStatus,
        false,
      );

      setUpAll(() async {
        getAccountRepository = MockGetAccountRepository();
      });
      setUp(() async {
        getAccountBloc =
            GetAccountBloc(getAccountRepository: getAccountRepository);
      });

      test('Get account init state is should be unknown', () {
        expect(
            getAccountBloc.state,
            const GetAccountState(
                status: GetAccountStatus.unknown, responseMessage: ''));
      });

      blocTest<GetAccountBloc, GetAccountState>(
        'emit "GetAccountStatus.success" WHEN GetAccountSubmitted event triggered',
        build: () {
          when(getAccountRepository.getAccount())
              .thenAnswer((_) async => account);
          return getAccountBloc;
        },
        act: (bloc) => bloc.add(GetAccountSubmitted()),
        expect: () => {
          const GetAccountState(
              status: GetAccountStatus.loading,
              responseMessage: '',
              account: null),
          GetAccountState(
              status: GetAccountStatus.success,
              responseMessage: 'Successfully get account!',
              account: account),
        },
      );
      tearDown(() => getAccountBloc.close());
    },
  );
}
