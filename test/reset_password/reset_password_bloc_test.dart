import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/domain/reset_password_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/domain/reset_password_response.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/repository/reset_password_repository.dart';

import 'reset_password_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockResetPasswordBloc
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
                  status: ResetPasswordStatus.unknown,
                  email: '',
                  isEmailValid: false,
                  emailErrorText: '',
                  responseMessage: ''));
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits "ResetPasswordStatus.unknown" and "isEmailValid = false" WHEN entered an invalid email.',
        build: () => resetPasswordBloc,
        act: (bloc) => bloc.add(const ResetPasswordEmailChanged('sadfasdf')),
        expect: () => {
          const ResetPasswordState(
              status: ResetPasswordStatus.unknown,
              email: 'sadfasdf',
              isEmailValid: false,
              emailErrorText: 'Enter valid email',
              responseMessage: ''),
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits "ResetPasswordStatus.unknown" and "isEmailValid = true" WHEN entered an valid email.',
        build: () => resetPasswordBloc,
        act: (bloc) => bloc.add(
          const ResetPasswordEmailChanged('asklora@loratechai.com'),
        ),
        expect: () => {
          const ResetPasswordState(
              status: ResetPasswordStatus.unknown,
              email: 'asklora@loratechai.com',
              isEmailValid: true,
              emailErrorText: '',
              responseMessage: '')
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
          'emits "ResetPasswordStatus.success" WHEN entered valid email AND pressed "Submit" button.',
          build: () {
            when(resetPasswordRepository.resetPassword(
                    email: 'asklora@loratechai.com'))
                .thenAnswer(
              (_) => Future.value(
                ResetPasswordResponse('Reset Password Successfull'),
              ),
            );
            return resetPasswordBloc;
          },
          act: (bloc) => {
                bloc.add(
                    const ResetPasswordEmailChanged('asklora@loratechai.com')),
                bloc.add(const ResetPasswordSubmitted())
              },
          expect: () => {
                const ResetPasswordState(
                    status: ResetPasswordStatus.unknown,
                    email: 'asklora@loratechai.com',
                    isEmailValid: true,
                    emailErrorText: '',
                    responseMessage: ''),
                const ResetPasswordState(
                    status: ResetPasswordStatus.loading,
                    email: 'asklora@loratechai.com',
                    isEmailValid: true,
                    emailErrorText: '',
                    responseMessage: ''),
                const ResetPasswordState(
                    status: ResetPasswordStatus.success,
                    email: 'asklora@loratechai.com',
                    isEmailValid: true,
                    emailErrorText: '',
                    responseMessage: 'Succesfully sent new password!')
              });

      tearDown(() => resetPasswordBloc.close());
    },
  );
}
