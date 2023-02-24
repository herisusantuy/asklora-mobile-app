import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/core/domain/token/repository/token_repository.dart';
import 'package:asklora_mobile_app/feature/auth/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/forgot_password/domain/forgot_password_api_client.dart';
import 'package:asklora_mobile_app/feature/auth/forgot_password/domain/forgot_password_response.dart';
import 'package:asklora_mobile_app/feature/auth/forgot_password/repository/forgot_password_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forgot_password_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockForgotPasswordBloc
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

@GenerateMocks([ForgotPasswordRepository])
@GenerateMocks([ForgotPasswordApiClient])
void main() {
  group(
    'Forgot Password Screen Bloc Test',
    () {
      late MockForgotPasswordRepository forgotPasswordRepository;
      late ForgotPasswordBloc forgotPasswordBloc;

      setUpAll(
        () async {
          forgotPasswordRepository = MockForgotPasswordRepository();
        },
      );

      setUp(
        () async {
          forgotPasswordBloc = ForgotPasswordBloc(
              forgotPasswordRepository: forgotPasswordRepository,
              tokenRepository: TokenRepository());
        },
      );
      test(
        'Forgot Password init state is should be unknown',
        () {
          expect(
              forgotPasswordBloc.state,
              const ForgotPasswordState(
                response: BaseResponse(),
                email: '',
                emailErrorText: '',
              ));
        },
      );

      blocTest<ForgotPasswordBloc, ForgotPasswordState>(
        'emits "ForgotPasswordStatus.unknown" and "isEmailValid = false" WHEN entered an invalid email.',
        build: () => forgotPasswordBloc,
        act: (bloc) => bloc.add(const ForgotPasswordEmailChanged('sadfasdf')),
        expect: () => {
          const ForgotPasswordState(
            response: BaseResponse(),
            email: 'sadfasdf',
            emailErrorText: 'Enter valid email',
          ),
        },
      );

      blocTest<ForgotPasswordBloc, ForgotPasswordState>(
        'emits "ForgotPasswordStatus.unknown" and "isEmailValid = true" WHEN entered an valid email.',
        build: () => forgotPasswordBloc,
        act: (bloc) => bloc.add(
          const ForgotPasswordEmailChanged('abc@abc.com'),
        ),
        expect: () => {
          const ForgotPasswordState(
            response: BaseResponse(),
            email: 'abc@abc.com',
            emailErrorText: '',
          )
        },
      );

      blocTest<ForgotPasswordBloc, ForgotPasswordState>(
          'emits "ForgotPasswordStatus.success" WHEN entered valid email AND pressed "Submit" button.',
          build: () {
            when(forgotPasswordRepository.forgotPassword(email: 'abc@abc.com'))
                .thenAnswer((_) => Future.value(BaseResponse.complete(
                    const ForgotPasswordResponse(
                        'Link for Password reset is sent to email.'),
                    message: 'Link for Password reset is sent to email.')));

            return forgotPasswordBloc;
          },
          act: (bloc) => {
                bloc.add(const ForgotPasswordEmailChanged('abc@abc.com')),
                bloc.add(const ForgotPasswordSubmitted())
              },
          expect: () => {
                const ForgotPasswordState(
                    response: BaseResponse(),
                    email: 'abc@abc.com',
                    emailErrorText: ''),
                ForgotPasswordState(
                  response: BaseResponse.loading(),
                  email: 'abc@abc.com',
                  emailErrorText: '',
                ),
                ForgotPasswordState(
                    response: BaseResponse.complete(
                        const ForgotPasswordResponse(
                            'Link for Password reset is sent to email.'),
                        message: 'Link for Password reset is sent to email.'),
                    email: 'abc@abc.com',
                    emailErrorText: '',
                    deeplinkStatus: DeeplinkStatus.inProgress)
              });

      tearDown(() => forgotPasswordBloc.close());
    },
  );
}
