import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/sign_up_repository.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required SignUpRepository signUpRepository,
  })  : _signUpRepository = signUpRepository,
        super(const SignUpState()) {
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  final SignUpRepository _signUpRepository;

  void _onUsernameChanged(
    SignUpUsernameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(
          response: BaseResponse.unknown(),
          username: event.username,
          isEmailValid: event.username.isValidEmail(),
          usernameErrorText:
              (event.username.isValidEmail() || event.username.isEmpty)
                  ? ''
                  : 'Enter valid email'),
    );
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        response: BaseResponse.unknown(),
        password: event.password,
        passwordErrorText:
            (event.password.isValidPassword() || event.password.isEmpty)
                ? ''
                : 'Enter valid password',
        isPasswordValid: event.password.isValidPassword()));
  }

  void _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _signUpRepository.signUp(
          email: state.username, password: state.password);
      emit(state.copyWith(response: data));
    } on ConflictException {
      emit(state.copyWith(
          response:
              BaseResponse.error('Account with this email already exists')));
    } on BadRequestException {
      emit(state.copyWith(
          response: BaseResponse.error('This password is too common.')));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(e.toString())));
    }
  }
}
