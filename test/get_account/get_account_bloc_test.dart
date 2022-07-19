import 'package:asklora_mobile_app/core/utils/storage/secure_storage.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/account_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/account_api_client.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/get_account_response.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/trade_requirements_status.dart';
import 'package:asklora_mobile_app/feature/user/account/repository/account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_account_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockGetAccountBloc extends MockBloc<AccountEvent, AccountState>
    implements AccountBloc {}

@GenerateMocks([AccountRepository])
@GenerateMocks([AccountApiClient])
@GenerateMocks([SecureStorage])
void main() {
  group(
    'Get account Bloc test',
    () {
      late MockAccountRepository mockAccountRepository;
      late AccountBloc getAccountBloc;
      late SecureStorage secureStorage;
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
        mockAccountRepository = MockAccountRepository();
        secureStorage = MockSecureStorage();
      });
      setUp(() async {

        getAccountBloc =
            AccountBloc(getAccountRepository: mockAccountRepository, secureStorage: secureStorage);
      });

      test('Get account init state is should be unknown', () {
        expect(
            getAccountBloc.state,
            const AccountState(
                status: GetAccountStatus.unknown, responseMessage: ''));
      });

      blocTest<AccountBloc, AccountState>(
        'emit "GetAccountStatus.success" WHEN GetAccountSubmitted event triggered',
        build: () {
          when(mockAccountRepository.getAccount())
              .thenAnswer((_) async => account);
          return getAccountBloc;
        },
        act: (bloc) => bloc.add(GetAccount()),
        expect: () => {
          const AccountState(
              status: GetAccountStatus.fetchingAccount,
              responseMessage: '',
              account: null),
          AccountState(
              status: GetAccountStatus.success,
              responseMessage: 'Successfully get account!',
              account: account),
        },
      );
      tearDown(() => getAccountBloc.close());
    },
  );
}
