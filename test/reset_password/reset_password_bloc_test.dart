import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/core/domain/token/repository/token_repository.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/domain/reset_password_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/repository/reset_password_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_password_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockForgotPasswordBloc
    extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

@GenerateMocks([ResetPasswordRepository])
@GenerateMocks([ResetPasswordApiClient])
void main() {
  group(
    'Reset Password Screen Bloc Test',
    () {
      late MockResetPasswordRepository resetPasswordRepository;
      late ResetPasswordBloc resetPasswordBloc;

      setUpAll(
        () async {
          resetPasswordRepository = MockResetPasswordRepository();
        },
      );

      setUp(
        () async {
          resetPasswordBloc = ResetPasswordBloc(
              resetPasswordRepository: resetPasswordRepository,
              tokenRepository: TokenRepository());
        },
      );
      test(
        'Reset Password init state is should be unknown',
        () {
          expect(
              resetPasswordBloc.state,
              const ResetPasswordState(
                  response: BaseResponse(),
                  password: '',
                  confirmPassword: '',
                  isPasswordValid: false,
                  isConfirmPasswordValid: false,
                  passwordErrorText: '',
                  confirmPasswordErrorText: ''));
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits "ResetPasswordStatus.unknown" and "isPasswordValid = false" and "isConfirmPasswordValid = false" WHEN entered an invalid password.',
        build: () => resetPasswordBloc,
        act: (bloc) {
          bloc.add(const ResetPasswordPasswordChanged('aaaBBB'));
          bloc.add(const ResetPasswordConfirmPasswordChanged('12345'));
        },
        expect: () => {
          ResetPasswordState(
              response: BaseResponse.unknown(),
              password: 'aaaBBB',
              confirmPassword: '',
              isPasswordValid: false,
              isConfirmPasswordValid: false,
              passwordErrorText: 'Enter valid password',
              confirmPasswordErrorText: ''),
          ResetPasswordState(
              response: BaseResponse.unknown(),
              password: 'aaaBBB',
              confirmPassword: '12345',
              isPasswordValid: false,
              isConfirmPasswordValid: false,
              passwordErrorText: 'Enter valid password',
              confirmPasswordErrorText: 'Enter valid password'),
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits "ResetPasswordStatus.unknown" and "isPasswordValid = false" and "isConfirmPasswordValid = false" and "passwordErrorText= Your password does not match."  and "confirmPasswordErrorText= Your password does not match."WHEN entered an valid password and confirmPassword but different value.',
        build: () => resetPasswordBloc,
        act: (bloc) {
          bloc.add(const ResetPasswordPasswordChanged('Aa1234567'));
          bloc.add(const ResetPasswordConfirmPasswordChanged('aA1234567'));
        },
        expect: () => {
          ResetPasswordState(
              response: BaseResponse.unknown(),
              password: 'Aa1234567',
              confirmPassword: '',
              isPasswordValid: false,
              isConfirmPasswordValid: false,
              passwordErrorText: 'Your password does not match.',
              confirmPasswordErrorText: ''),
          ResetPasswordState(
              response: BaseResponse.unknown(),
              password: 'Aa1234567',
              confirmPassword: 'aA1234567',
              isPasswordValid: false,
              isConfirmPasswordValid: false,
              passwordErrorText: 'Your password does not match.',
              confirmPasswordErrorText: 'Your password does not match.'),
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits "ResetPasswordStatus.unknown" and "isPasswordValid = true" and "isConfirmPasswordValid = true" and "passwordErrorText='
        '"  and "confirmPasswordErrorText='
        ' "WHEN entered an valid password and confirmPassword with same value.',
        build: () => resetPasswordBloc,
        act: (bloc) {
          bloc.add(const ResetPasswordPasswordChanged('Aa1234567'));
          bloc.add(const ResetPasswordConfirmPasswordChanged('Aa1234567'));
        },
        expect: () => {
          ResetPasswordState(
              response: BaseResponse.unknown(),
              password: 'Aa1234567',
              confirmPassword: '',
              isPasswordValid: false,
              isConfirmPasswordValid: false,
              passwordErrorText: 'Your password does not match.',
              confirmPasswordErrorText: ''),
          ResetPasswordState(
              response: BaseResponse.unknown(),
              password: 'Aa1234567',
              confirmPassword: 'Aa1234567',
              isPasswordValid: true,
              isConfirmPasswordValid: true,
              passwordErrorText: '',
              confirmPasswordErrorText: ''),
        },
      );

      tearDown(() => resetPasswordBloc.close());
    },
  );
}
