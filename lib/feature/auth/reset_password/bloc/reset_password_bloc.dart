import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/base_api_client.dart';
import '../../../../core/domain/base_response.dart';
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
          response: BaseResponse.unknown(),
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
      emit(state.copyWith(response: BaseResponse.loading()));
      var data =
          await _resetPasswordRepository.resetPassword(email: state.email);
      data.copyWith(message: 'Successfully sent new password!');

      emit(state.copyWith(response: data));
    } on BadRequestException {
      emit(state.copyWith(response: BaseResponse.error('Bad request.')));
    } catch (e) {
      state.copyWith(response: BaseResponse.error(e.toString()));
    }
  }
}
