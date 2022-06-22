import 'package:asklora_mobile_app/feature/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/sign_up_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/sign_up_response.dart';
import 'package:asklora_mobile_app/feature/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:asklora_mobile_app/feature/auth/sign_up/repository/sign_up_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import '../mocks/mocks.dart';
import 'sign_up_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockCounterBloc extends MockBloc<SignUpEvent, SignUpState>
    implements SignUpBloc {}

@GenerateMocks([SignUpRepository])
@GenerateMocks([SignUpApiClient])
void main() async {
  group('Home Screen Bloc Test', () {
    late MockSignUpRepository signUpRepository;
    late SignUpBloc signUpBloc;

    setUpAll(() async {
      signUpRepository = MockSignUpRepository();
    });

    setUp(() async {
      signUpBloc = SignUpBloc(signUpRepository: signUpRepository);
    });

    test('Sign Up Bloc init state is should be `unknown`', () {
      expect(
          signUpBloc.state,
          const SignUpState(
              status: SignUpStatus.unknown,
              isEmailValid: false,
              isPasswordValid: false,
              username: '',
              usernameErrorText: '',
              password: '',
              passwordErrorText: ''));
    });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.unknown` and `isEmailValid = false` WHEN '
        'entered an invalid email',
        build: () => signUpBloc,
        act: (bloc) => bloc.add(const SignUpUsernameChanged('kkkkkk')),
        expect: () => {
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: false,
                  isPasswordValid: false,
                  username: 'kkkkkk',
                  usernameErrorText: 'Enter valid email',
                  password: '',
                  passwordErrorText: '')
            });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.unknown` and `isEmailValid = false` WHEN '
        'entered an invalid email',
        build: () => signUpBloc,
        act: (bloc) => bloc.add(const SignUpUsernameChanged('test@test.c@')),
        expect: () => {
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: false,
                  isPasswordValid: false,
                  username: 'test@test.c@',
                  usernameErrorText: 'Enter valid email',
                  password: '',
                  passwordErrorText: '')
            });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.unknown` and `isEmailValid = true` WHEN '
        'entered an valid email',
        build: () => signUpBloc,
        act: (bloc) => bloc.add(const SignUpUsernameChanged('test@test.com')),
        expect: () => {
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: true,
                  isPasswordValid: false,
                  username: 'test@test.com',
                  usernameErrorText: '',
                  password: '',
                  passwordErrorText: '')
            });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.unknown` and `isPasswordValid = false` WHEN '
        'entered less than 8 chars of password',
        build: () => signUpBloc,
        act: (bloc) => bloc.add(const SignUpPasswordChanged('abcde')),
        expect: () => {
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: false,
                  isPasswordValid: false,
                  username: '',
                  usernameErrorText: '',
                  password: 'abcde',
                  passwordErrorText: '')
            });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.unknown` and `isPasswordValid = false` WHEN '
        'entered chars of password without numbers',
        build: () => signUpBloc,
        act: (bloc) => bloc.add(const SignUpPasswordChanged('abcdefge')),
        expect: () => {
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: false,
                  isPasswordValid: false,
                  username: '',
                  usernameErrorText: '',
                  password: 'abcdefge',
                  passwordErrorText: '')
            });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.unknown` and `isPasswordValid = true` WHEN '
        'entered correct password',
        build: () => signUpBloc,
        act: (bloc) => bloc.add(const SignUpPasswordChanged('password1')),
        expect: () => {
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: false,
                  isPasswordValid: true,
                  username: '',
                  usernameErrorText: '',
                  password: 'password1',
                  passwordErrorText: '')
            });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.unknown` and `isPasswordValid = true` and `isEmailValid = true` WHEN '
        'entered correct password and correct email',
        build: () => signUpBloc,
        act: (bloc) => {
              bloc.add(const SignUpUsernameChanged('kk@test.com')),
              bloc.add(const SignUpPasswordChanged('password1')),
            },
        expect: () => {
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: true,
                  isPasswordValid: false,
                  username: 'kk@test.com',
                  usernameErrorText: '',
                  password: '',
                  passwordErrorText: ''),
              const SignUpState(
                  status: SignUpStatus.unknown,
                  isEmailValid: true,
                  isPasswordValid: true,
                  username: 'kk@test.com',
                  usernameErrorText: '',
                  password: 'password1',
                  passwordErrorText: '')
            });

    blocTest<SignUpBloc, SignUpState>(
        'emits `SignUpStatus.success` WHEN '
        'entered correct password and correct email WHEN '
        'pressed `Submit` button',
        build: () {
          when(signUpRepository.signUp(
                  email: 'kk@test.com', password: 'password1'))
              .thenAnswer(
                  (_) => Future.value(SignUpResponse('Sign Up Successful')));
          return signUpBloc;
        },
        act: (bloc) => {
              bloc.add(const SignUpUsernameChanged('kk@test.com')),
              bloc.add(const SignUpPasswordChanged('password1')),
              bloc.add(const SignUpSubmitted()),
            },
        expect: () => {
              const SignUpState(
                status: SignUpStatus.unknown,
                isEmailValid: true,
                username: 'kk@test.com',
              ),
              const SignUpState(
                status: SignUpStatus.unknown,
                isEmailValid: true,
                isPasswordValid: true,
                username: 'kk@test.com',
                password: 'password1',
              ),
              const SignUpState(
                  status: SignUpStatus.loading,
                  isEmailValid: true,
                  isPasswordValid: true,
                  username: 'kk@test.com',
                  usernameErrorText: '',
                  password: 'password1',
                  passwordErrorText: ''),
              const SignUpState(
                  status: SignUpStatus.success,
                  isEmailValid: true,
                  isPasswordValid: true,
                  username: 'kk@test.com',
                  usernameErrorText: '',
                  responseMessage: 'Account created successfully!',
                  password: 'password1',
                  passwordErrorText: '')
            });

    tearDown(() => {signUpBloc.close()});

    Future<void> _buildHomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const SignUpScreen(),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Show Sign-Up screen with `Username`, `Password` input field and `Submit` button',
        (tester) async {
      await _buildHomeScreen(tester);
      var emailInput = find.byKey(const Key('sing_up_email_input'));
      expect(emailInput, findsOneWidget);
      var passwordInput = find.byKey(const Key('sing_up_password_input'));
      expect(passwordInput, findsOneWidget);
      var signUpButton = find.byKey(const Key('sing_up_submit_button'));
      expect(signUpButton, findsOneWidget);
    });

    testWidgets(
        'Show Sign-Up screen with `Username`, `Password` input field and `Submit` button',
        (tester) async {
      await _buildHomeScreen(tester);
      var emailInput = find.byKey(const Key('sing_up_email_input'));
      expect(emailInput, findsOneWidget);
      var passwordInput = find.byKey(const Key('sing_up_password_input'));
      expect(passwordInput, findsOneWidget);
      var signUpButton = find.byKey(const Key('sing_up_submit_button'));
      expect(signUpButton, findsOneWidget);
    });
  });
}
