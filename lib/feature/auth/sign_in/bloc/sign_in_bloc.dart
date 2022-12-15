import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/sign_in_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required SignInRepository signInRepository})
      : _signInRepository = signInRepository,
        super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  final SignInRepository _signInRepository;

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(
        response: BaseResponse.unknown(),
        emailAddress: event.emailAddress,
        isEmailValid: event.emailAddress.isValidEmail(),
        emailAddressErrorText:
            (event.emailAddress.toLowerCase().isValidEmail() ||
                    event.emailAddress.isEmpty)
                ? ''
                : 'Enter valid email'));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
        response: BaseResponse.unknown(),
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
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _signInRepository.signIn(
          email: state.emailAddress, password: state.password);

      data.copyWith(message: 'Authentication Success');

      emit(state.copyWith(response: data));
    } on UnauthorizedException {
      emit(state.copyWith(response: BaseResponse.error('Invalid Password')));
    } on NotFoundException {
      emit(state.copyWith(
          response:
              BaseResponse.error('User does not exist with the given email')));
    } on NotAcceptableException {
      emit(state.copyWith(
          response: BaseResponse.error('User email is not verified')));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(e.toString())));
    }
  }
}
