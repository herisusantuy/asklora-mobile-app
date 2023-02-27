import 'package:asklora_mobile_app/core/domain/base_response.dart';
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
              resetPasswordRepository: resetPasswordRepository);
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
          const ResetPasswordState(
              response: BaseResponse(),
              password: 'aaaBBB',
              confirmPassword: '',
              passwordErrorText: 'Enter valid password',
              confirmPasswordErrorText: ''),
          const ResetPasswordState(
              response: BaseResponse(),
              password: 'aaaBBB',
              confirmPassword: '12345',
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
          const ResetPasswordState(
              response: BaseResponse(),
              password: 'Aa1234567',
              confirmPassword: '',
              passwordErrorText: 'Your password does not match.',
              confirmPasswordErrorText: ''),
          const ResetPasswordState(
              response: BaseResponse(),
              password: 'Aa1234567',
              confirmPassword: 'aA1234567',
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
          const ResetPasswordState(
              response: BaseResponse(),
              password: 'Aa1234567',
              confirmPassword: '',
              passwordErrorText: 'Your password does not match.',
              confirmPasswordErrorText: ''),
          const ResetPasswordState(
              response: BaseResponse(),
              password: 'Aa1234567',
              confirmPassword: 'Aa1234567',
              passwordErrorText: '',
              confirmPasswordErrorText: ''),
        },
      );

      tearDown(() => resetPasswordBloc.close());
    },
  );
}
