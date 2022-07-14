import 'package:asklora_mobile_app/core/domain/token/repository/token_repository.dart';
import 'package:asklora_mobile_app/feature/auth/sign_out/bloc/sign_out_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/sign_out/domain/sign_out_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/sign_out/repository/sign_out_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_out_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockCounterBloc extends MockBloc<SignOutEvent, SignOutState>
    implements SignOutBloc {}

@GenerateMocks([SignOutRepository])
@GenerateMocks([SignOutApiClient])
@GenerateMocks([TokenRepository])
void main() async {
  group('Sign Up Screen Bloc Tests', () {
    late MockSignOutRepository signOutRepository;
    late MockTokenRepository tokenRepository;
    late SignOutBloc signOutBloc;

    setUpAll(() async {
      signOutRepository = MockSignOutRepository();
      tokenRepository = MockTokenRepository();
    });

    setUp(() async {
      signOutBloc = SignOutBloc(tokenRepository: tokenRepository);
    });

    test('Sign Out Bloc init state is should be `unknown`', () {
      expect(
          signOutBloc.state,
          const SignOutState(
              status: SignOutStatus.unknown, responseMessage: ''));
    });

    blocTest<SignOutBloc, SignOutState>(
        'emits `SignOutStatus.success` and `responseMessage = Sign Out Success` WHEN '
        'press Sign Out Button',
        build: () {
          when(tokenRepository.getRefreshToken())
              .thenAnswer((realInvocation) => Future.value('refresh_token'));
          when(signOutRepository.signOut('refresh_token'))
              .thenAnswer((_) => Future.value(true));
          when(tokenRepository.deleteAll())
              .thenAnswer((realInvocation) => Future.value());
          return signOutBloc;
        },
        act: (bloc) => bloc.add(const SignOutSubmitted()),
        expect: () => {
              const SignOutState(
                  status: SignOutStatus.loading, responseMessage: ''),
              const SignOutState(
                  status: SignOutStatus.success,
                  responseMessage: 'Sign Out Success')
            });

    tearDown(() => {signOutBloc.close()});
  });
}
