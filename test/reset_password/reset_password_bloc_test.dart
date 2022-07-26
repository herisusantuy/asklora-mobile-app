import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/domain/reset_password_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/domain/reset_password_response.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/repository/reset_password_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
                response: BaseResponse(),
                email: '',
                isEmailValid: false,
                emailErrorText: '',
              ));
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits "ResetPasswordStatus.unknown" and "isEmailValid = false" WHEN entered an invalid email.',
        build: () => resetPasswordBloc,
        act: (bloc) => bloc.add(const ResetPasswordEmailChanged('sadfasdf')),
        expect: () => {
          ResetPasswordState(
            response: BaseResponse.unknown(),
            email: 'sadfasdf',
            isEmailValid: false,
            emailErrorText: 'Enter valid email',
          ),
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits "ResetPasswordStatus.unknown" and "isEmailValid = true" WHEN entered an valid email.',
        build: () => resetPasswordBloc,
        act: (bloc) => bloc.add(
          const ResetPasswordEmailChanged('abc@abc.com'),
        ),
        expect: () => {
          ResetPasswordState(
            response: BaseResponse.unknown(),
            email: 'abc@abc.com',
            isEmailValid: true,
            emailErrorText: '',
          )
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
          'emits "ResetPasswordStatus.success" WHEN entered valid email AND pressed "Submit" button.',
          build: () {
            when(resetPasswordRepository.resetPassword(email: 'abc@abc.com'))
                .thenAnswer((_) => Future.value(
                    const BaseResponse<ResetPasswordResponse>(
                        data: ResetPasswordResponse(
                            'Successfully sent new password!'),
                        state: ResponseState.success)));

            return resetPasswordBloc;
          },
          act: (bloc) => {
                bloc.add(const ResetPasswordEmailChanged('abc@abc.com')),
                bloc.add(const ResetPasswordSubmitted())
              },
          expect: () => {
                ResetPasswordState(
                    response: BaseResponse.unknown(),
                    email: 'abc@abc.com',
                    isEmailValid: true,
                    emailErrorText: ''),
                ResetPasswordState(
                  response: BaseResponse.loading(),
                  email: 'abc@abc.com',
                  isEmailValid: true,
                  emailErrorText: '',
                ),
                const ResetPasswordState(
                  response: BaseResponse<ResetPasswordResponse>(
                      data: ResetPasswordResponse(
                          'Successfully sent new password!'),
                      state: ResponseState.success),
                  email: 'abc@abc.com',
                  isEmailValid: true,
                  emailErrorText: '',
                )
              });

      tearDown(() => resetPasswordBloc.close());
    },
  );
}
