import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/sign_in_repository.dart';

part 'sign_in_state.dart';

part 'sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required SignInRepository signInRepository,
  })  : _signInRepository = signInRepository,
        super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  final SignInRepository _signInRepository;

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(
        status: SignInStatus.unknown,
        emailAddress: event.emailAddress,
        isEmailValid: event.emailAddress.isValidEmail(),
        emailAddressErrorText:
            (event.emailAddress.isValidEmail() || event.emailAddress.isEmpty)
                ? ''
                : 'Enter valid email'));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
        status: SignInStatus.unknown,
        password: event.password,
        isPasswordValid: event.password.isValidPassword(),
        passwordErrorText:
            (event.password.isValidPassword() || event.password.isEmpty)
                ? ''
                : 'Enter valid password'));
  }

  void _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SignInStatus.loading));
      // ignore: unused_local_variable
      var response = await _signInRepository.signIn(
          email: state.emailAddress, password: state.password);
      emit(state.copyWith(
          status: SignInStatus.success,
          responseMessage: 'Authentication Success'));
    } on UnauthorizedException {
      emit(state.copyWith(
          status: SignInStatus.failure, responseMessage: 'Invalid Password'));
    } on NotFoundException {
      emit(state.copyWith(
          status: SignInStatus.failure,
          responseMessage: 'User does not exist with the given email'));
    } catch (e) {
      emit(state.copyWith(
          status: SignInStatus.failure, responseMessage: e.toString()));
    }
  }
}
