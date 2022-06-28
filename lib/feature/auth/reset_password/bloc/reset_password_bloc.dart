import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/reset_password_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({required ResetPasswordRepository resetPasswordRepository})
      : _resetPasswordRepository = resetPasswordRepository,
        super(const ResetPasswordState()) {
    on<ResetPasswordEmailChanged>(_onEmailChanged);
    on<ResetPasswordSubmitted>(_onResetPasswordSubmitted);
  }

  final ResetPasswordRepository _resetPasswordRepository;

  void _onEmailChanged(
    ResetPasswordEmailChanged event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(
      state.copyWith(
          status: ResetPasswordStatus.unknown,
          email: event.email,
          isEmailValid: event.email.isValidEmail(),
          emailErrorText: (event.email.isValidEmail() || event.email.isEmpty)
              ? ''
              : 'Enter valid email'),
    );
  }

  void _onResetPasswordSubmitted(
      ResetPasswordSubmitted event, Emitter<ResetPasswordState> emit) async {
    try {
      emit(state.copyWith(status: ResetPasswordStatus.loading));
      // ignore: unused_local_variable
      var response =
          await _resetPasswordRepository.resetPassword(email: state.email);

      emit(state.copyWith(
          status: ResetPasswordStatus.success,
          responseMessage: 'Succesfully sent new password!'));
    } on BadRequestException {
      emit(
        state.copyWith(
            status: ResetPasswordStatus.failure,
            responseMessage: 'Bad request.'),
      );
    } catch (e) {
      emit(state.copyWith(
          status: ResetPasswordStatus.failure, responseMessage: e.toString()));
    }
  }
}
