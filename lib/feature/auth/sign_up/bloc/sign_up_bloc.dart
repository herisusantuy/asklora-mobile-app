import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/alpaca/alpaca_api_client.dart';
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
          status: SignUpStatus.unknown,
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
        status: SignUpStatus.unknown,
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
      emit(state.copyWith(status: SignUpStatus.loading));
      var response = await _signUpRepository.signUp(
          email: state.username, password: state.password);
      emit(state.copyWith(
          status: SignUpStatus.success,
          responseMessage: 'Account created successfully!'));
    } on ConflictException {
      emit(state.copyWith(
          status: SignUpStatus.failure,
          responseMessage: 'Account with this email already exists'));
    } on BadRequestException {
      emit(state.copyWith(
          status: SignUpStatus.failure,
          responseMessage: 'This password is too common.'));
    } catch (e) {
      emit(state.copyWith(
          status: SignUpStatus.failure, responseMessage: e.toString()));
    }
  }
}
