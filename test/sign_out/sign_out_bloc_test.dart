import 'package:asklora_mobile_app/feature/auth/sign_out/bloc/sign_out_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/sign_out/domain/sign_out_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/sign_out/domain/sign_out_response.dart';
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
void main() async {
  group('Sign Up Screen Bloc Tests', () {
    late MockSignOutRepository signOutRepository;
    late SignOutBloc signOutBloc;

    setUpAll(() async {
      signOutRepository = MockSignOutRepository();
    });

    setUp(() async {
      signOutBloc = SignOutBloc(signOutRepository: signOutRepository);
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
          when(signOutRepository.signOut()).thenAnswer(
              (_) => Future.value(SignOutResponse('Sign Out Successful')));
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
