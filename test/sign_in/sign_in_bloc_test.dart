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
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/account_contact.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/account_identity.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/get_account_response.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/trade_requirements_status.dart';
import 'package:asklora_mobile_app/feature/user/account/repository/account_repository.dart';
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
void main() async {
  group('Sign In Screen Bloc Test', () {
    late MockSignInRepository signInRepository;
    late MockUserJourneyRepository userJourneyRepository;
    late SignInBloc signInBloc;
    late MockRepository mockRepository;
    late SharedPreference sharedPreference;
    late AccountRepository accountRepository;

    final AccountContact contact = AccountContact(
        email: 'asd@mail.com',
        countryCode: '+62',
        phoneNumber: '811111111',
        streetAddress: 'Qwerty asdfg',
        city: 'qwe',
        unit: 'no 01',
        state: 'asd',
        postalCode: '111111',
        country: 'ASD');
    final AccountIdentity identity = AccountIdentity(
        givenName: 'asd',
        middleName: 'asd',
        familyName: 'asd',
        chineseName: 'asd',
        dateOfBirth: 'asd',
        taxId: '123',
        taxIdType: 'USA_SSN',
        countryOfResidentship: 'asd',
        countryOfCitizenship: 'asd',
        countryOfBirth: 'asd',
        countryOfTaxResidence: 'asd',
        fundingSource: 'asd');
    final tradeRequirementStatus = TradeRequirementsStatus(
      false,
      false,
      false,
      false,
      false,
    );
    final GetAccountResponse account = GetAccountResponse(
      'kk@kk.com',
      tradeRequirementStatus,
      false,
      contact,
      identity,
    );

    setUpAll(
      () async {
        signInRepository = MockSignInRepository();
        mockRepository = MockRepository();
        userJourneyRepository = MockUserJourneyRepository();
        sharedPreference = MockSharedPreference();
        accountRepository = MockAccountRepository();

        when(mockRepository.saveRefreshToken('token')).thenAnswer((_) async {
          null;
        });
        when(mockRepository.saveAccessToken('token'))
            .thenAnswer((_) async => {null});

        when(sharedPreference.writeData(sfKeyEmail, 'kk@kk.com'))
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
            sharedPreference: sharedPreference);
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
              ),
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'qweasdzxc',
                isEmailValid: false,
                emailAddressErrorText: 'Enter valid email',
                password: 'TestQWE123',
                isPasswordValid: true,
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
                isPasswordValid: false,
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

          when(accountRepository.getAccount()).thenAnswer((_) async => account);

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
              ),
              SignInState(
                response: BaseResponse.unknown(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: 'TestQWE123',
                isPasswordValid: true,
              ),
              SignInState(
                response: BaseResponse.loading(),
                emailAddress: 'nyoba@yopmail.com',
                isEmailValid: true,
                emailAddressErrorText: '',
                password: 'TestQWE123',
                isPasswordValid: true,
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
              )
            });
    tearDown(() => signInBloc.close());
  });
}
