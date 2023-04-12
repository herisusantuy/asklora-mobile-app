import 'package:asklora_mobile_app/app/bloc/app_bloc.dart';
import 'package:asklora_mobile_app/app/repository/user_journey_repository.dart';
import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/core/domain/token/repository/repository.dart';
import 'package:asklora_mobile_app/core/utils/storage/shared_preference.dart';
import 'package:asklora_mobile_app/core/utils/storage/storage_keys.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_response.dart';
import 'package:asklora_mobile_app/feature/auth/sign_in/repository/sign_in_repository.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/get_account/get_account_response.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/repository/account_repository.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/ppi_response_repository.dart';
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
@GenerateMocks([SharedPreference])
@GenerateMocks([AccountRepository])
@GenerateMocks([PpiResponseRepository])
void main() async {
  group('Sign In Screen Bloc Test', () {
    late MockSignInRepository signInRepository;
    late MockUserJourneyRepository userJourneyRepository;
    late SignInBloc signInBloc;
    late MockRepository mockRepository;
    late SharedPreference sharedPreference;
    late AccountRepository accountRepository;
    late PpiResponseRepository ppiResponseRepository;

    const GetAccountResponse account = GetAccountResponse(
        id: 0, username: 'someusername', email: 'kk@kk.com', isStaff: false);

    setUpAll(
      () async {
        signInRepository = MockSignInRepository();
        mockRepository = MockRepository();
        userJourneyRepository = MockUserJourneyRepository();
        sharedPreference = MockSharedPreference();
        accountRepository = MockAccountRepository();
        ppiResponseRepository = MockPpiResponseRepository();

        when(mockRepository.saveRefreshToken('token')).thenAnswer((_) async {
          null;
        });
        when(mockRepository.saveAccessToken('token'))
            .thenAnswer((_) async => {null});

        when(sharedPreference.writeData(sfKeyEmail, 'kk@kk.com'))
            .thenAnswer((_) async => true);
        when(sharedPreference.writeData(sfKeyPpiUsername, 'someusername'))
            .thenAnswer((_) async => true);
        when(sharedPreference.writeData(sfKeyPpiAccountId, 'some id'))
            .thenAnswer((_) async => true);
        when(sharedPreference.writeIntData(sfKeyPpiUserId, 0))
            .thenAnswer((_) async => true);
      },
    );

    setUp(
      () async {
        TestWidgetsFlutterBinding.ensureInitialized();
        signInBloc = SignInBloc(
            accountRepository: accountRepository,
            signInRepository: signInRepository,
            userJourneyRepository: userJourneyRepository,
            sharedPreference: sharedPreference,
            ppiResponseRepository: ppiResponseRepository);
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
              ),
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'qweasdzxc',
                isEmailValid: false,
                emailAddressErrorText: 'Enter valid email',
                password: 'TestQWE123',
              )
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

          when(accountRepository.getAccount())
              .thenAnswer((_) async => BaseResponse.complete(account));
          when(ppiResponseRepository.getUserSnapShotUserId('someusername'))
              .thenAnswer((_) => Future.value(BaseResponse.complete(SnapShot(
                  0,
                  'some name',
                  'some id',
                  'device id',
                  'created',
                  'updated',
                  Scores()))));

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
              ),
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: 'TestQWE123',
              ),
              SignInState(
                response: BaseResponse.loading(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: 'TestQWE123',
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
              )
            });
  });
}
