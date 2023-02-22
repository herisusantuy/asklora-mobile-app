import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/forgot_password_repository.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(
      {required ForgotPasswordRepository forgotPasswordRepository})
      : _forgotPasswordRepository = forgotPasswordRepository,
        super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
  }

  final ForgotPasswordRepository _forgotPasswordRepository;

  void _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(
      state.copyWith(
          response: BaseResponse.unknown(),
          email: event.email,
          isEmailValid: event.email.isValidEmail(),
          emailErrorText: (event.email.isValidEmail() || event.email.isEmpty)
              ? ''
              : 'Enter valid email'),
    );
  }

  void _onForgotPasswordSubmitted(
      ForgotPasswordSubmitted event, Emitter<ForgotPasswordState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data =
          await _forgotPasswordRepository.forgotPassword(email: state.email);
      data.copyWith(message: 'Link for Password reset is sent to email.');

      emit(state.copyWith(response: data));
    } on BadRequestException {
      emit(state.copyWith(
          response: BaseResponse.error('Your account is not active yet.')));
    } on NotFoundException {
      emit(state.copyWith(
          response:
              BaseResponse.error('User does not exist with the given email.')));
    } catch (e) {
      state.copyWith(response: BaseResponse.error(e.toString()));
    }
  }
}
