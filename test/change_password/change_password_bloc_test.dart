import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/settings/bloc/change_password/change_password_bloc.dart';
import 'package:asklora_mobile_app/feature/settings/domain/change_password/change_password_api_client.dart';
import 'package:asklora_mobile_app/feature/settings/repository/change_password_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockChangePassword
    extends MockBloc<ChangePasswordEvent, ChangePasswordState>
    implements ChangePasswordBloc {}

@GenerateMocks([ChangePasswordRepository])
@GenerateMocks([ChangePasswordApiClient])
void main() {
  group('Change Password Bloc Test', () {
    late MockChangePasswordRepository changePasswordRepository;
    late ChangePasswordBloc changePasswordBloc;

    setUpAll(() async {
      changePasswordRepository = MockChangePasswordRepository();
    });

    setUp(() async {
      changePasswordBloc = ChangePasswordBloc(
          changePasswordRepository: ChangePasswordRepository());
    });

    test('Change Password init state is should be unknown', () {
      expect(
          changePasswordBloc.state,
          const ChangePasswordState(
            response: BaseResponse(),
            password: '',
            newPassword: '',
            confirmNewPassword: '',
            confirmNewPasswordErrorText: '',
          ));
    });

    blocTest<ChangePasswordBloc, ChangePasswordState>(
      'when user input invalid new password and invalid confirm new password will show error text "Enter valid password"',
      build: () => changePasswordBloc,
      act: (bloc) {
        bloc.add(const PasswordChanged('aaabbbccc'));
        bloc.add(const NewPasswordChanged('12345678'));
        bloc.add(const ConfirmNewPasswordChanged('12345678'));
      },
      expect: () => {
        const ChangePasswordState(
          response: BaseResponse(),
          password: 'aaabbbccc',
          newPassword: '',
          confirmNewPassword: '',
          confirmNewPasswordErrorText: '',
        ),
        const ChangePasswordState(
          response: BaseResponse(),
          password: 'aaabbbccc',
          newPassword: '12345678',
          newPasswordErrorText: 'Enter valid password',
          confirmNewPassword: '',
          confirmNewPasswordErrorText: '',
        ),
        const ChangePasswordState(
          response: BaseResponse(),
          password: 'aaabbbccc',
          newPassword: '12345678',
          newPasswordErrorText: 'Enter valid password',
          confirmNewPassword: '12345678',
          confirmNewPasswordErrorText: 'Enter valid password',
        ),
      },
    );
    blocTest<ChangePasswordBloc, ChangePasswordState>(
      'when user input valid new password and input not match  confirm new password will show error text "Your password does not match"',
      build: () => changePasswordBloc,
      act: (bloc) {
        bloc.add(const PasswordChanged('aaabbbccc'));
        bloc.add(const NewPasswordChanged('Aa12345678'));
        bloc.add(const ConfirmNewPasswordChanged('Aa1234567'));
      },
      expect: () => {
        const ChangePasswordState(
          response: BaseResponse(),
          password: 'aaabbbccc',
          newPassword: '',
          confirmNewPassword: '',
          confirmNewPasswordErrorText: '',
        ),
        const ChangePasswordState(
          response: BaseResponse(),
          password: 'aaabbbccc',
          newPassword: 'Aa12345678',
          newPasswordErrorText: '',
          confirmNewPassword: '',
          confirmNewPasswordErrorText: '',
        ),
        const ChangePasswordState(
          response: BaseResponse(),
          password: 'aaabbbccc',
          newPassword: 'Aa12345678',
          newPasswordErrorText: '',
          confirmNewPassword: 'Aa1234567',
          confirmNewPasswordErrorText: 'Your password does not match',
        ),
      },
    );

    tearDown(() => changePasswordBloc.close());
  });
}
