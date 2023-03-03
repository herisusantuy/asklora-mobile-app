import 'package:asklora_mobile_app/app/bloc/app_bloc.dart';
import 'package:asklora_mobile_app/app/repository/user_journey_repository.dart';
import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/core/domain/token/repository/repository.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_response.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/repository/sign_in_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockSignInBloc extends MockBloc<SignInEvent, SignInState>
    implements SignInBloc {}

class MockRepository extends Mock implements Repository {}

@GenerateMocks([SignInRepository])
@GenerateMocks([UserJourneyRepository])
@GenerateMocks([SignInApiClient])
void main() async {
  group('Sign In Screen Bloc Test', () {
    late MockSignInRepository signInRepository;
    late MockUserJourneyRepository userJourneyRepository;
    late SignInBloc signInBloc;
    late MockRepository mockRepository;

    setUpAll(
      () async {
        signInRepository = MockSignInRepository();
        mockRepository = MockRepository();
        userJourneyRepository = MockUserJourneyRepository();

        when(mockRepository.saveRefreshToken('token')).thenAnswer((_) async {
          null;
        });
        when(mockRepository.saveAccessToken('token'))
            .thenAnswer((_) async => {null});
      },
    );

    setUp(
      () async {
        TestWidgetsFlutterBinding.ensureInitialized();
        signInBloc = SignInBloc(
            signInRepository: signInRepository,
            userJourneyRepository: userJourneyRepository);
      },
    );

    test(
      'Sign In init state is should be unknown',
      () {
        expect(
            signInBloc.state,
            const SignInState(
              response: BaseResponse(),
              emailAddress: '',
              isEmailValid: false,
              password: '',
              isPasswordValid: false,
              passwordErrorText: '',
            ));
      },
    );

    blocTest<SignInBloc, SignInState>(
        'emits "SignInStatus.unknown" and "isEmailValid = false" when entered an invalid email',
        build: () => signInBloc,
        act: (bloc) {
          bloc.add(const SignInEmailChanged('qweasdzxc'));
          bloc.add(const SignInPasswordChanged('TestQWE123'));
        },
        expect: () => {
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'qweasdzxc',
                isEmailValid: false,
                emailAddressErrorText: 'Enter valid email',
                password: '',
                isPasswordValid: false,
                passwordErrorText: '',
              ),
              SignInState(
                  response: BaseResponse.unknown(),
                  emailAddress: 'qweasdzxc',
                  isEmailValid: false,
                  emailAddressErrorText: 'Enter valid email',
                  password: 'TestQWE123',
                  isPasswordValid: true,
                  passwordErrorText: '')
            });
    blocTest<SignInBloc, SignInState>(
        'emits "SignInStatus.unknown" and "isEmailValid = true" when entered an valid email',
        build: () => signInBloc,
        act: (bloc) => bloc.add(const SignInEmailChanged('nyoba@yopmail.com')),
        expect: () => {
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: '',
                isPasswordValid: false,
                passwordErrorText: '',
              )
            });

    blocTest<SignInBloc, SignInState>(
        'emits "SignInStatus.success" WHEN entered valid email and correct password, Then pressed "Submit" button.',
        build: () {
          when(signInRepository.signIn(
                  email: 'nyoba@yopmail.com', password: 'TestQWE123'))
              .thenAnswer((_) => Future.value(const SignInResponse(
                  userJourney: UserJourney.investmentStyle)));
          when(userJourneyRepository.getUserJourney())
              .thenAnswer((_) => Future.value(UserJourney.investmentStyle));

          return signInBloc;
        },
        act: (bloc) => {
              bloc.add(const SignInEmailChanged('nyoba@yopmail.com')),
              bloc.add(const SignInPasswordChanged('TestQWE123')),
              bloc.add(const SignInSubmitted())
            },
        expect: () => {
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: '',
                isPasswordValid: false,
                passwordErrorText: '',
              ),
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: 'TestQWE123',
                isPasswordValid: true,
                passwordErrorText: '',
              ),
              SignInState(
                response: BaseResponse.loading(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: 'TestQWE123',
                isPasswordValid: true,
                passwordErrorText: '',
              ),
              const SignInState(
                response: BaseResponse<SignInResponse>(
                    data: SignInResponse(
                        userJourney: UserJourney.investmentStyle),
                    state: ResponseState.success),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: 'TestQWE123',
                isPasswordValid: true,
                passwordErrorText: '',
              )
            });
    tearDown(() => signInBloc.close());
  });
}
