import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/sign_out_repository.dart';

part 'sign_out_event.dart';

part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc({required SignOutRepository signOutRepository})
      : _signOutRepository = signOutRepository,
        super(const SignOutState()) {
    on<SignOutSubmitted>(_onSignOutSubmitted);
  }

  final SignOutRepository _signOutRepository;

  void _onSignOutSubmitted(
    SignOutSubmitted event,
    Emitter<SignOutState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SignOutStatus.loading));
      await _signOutRepository.signOut();
      emit(state.copyWith(
          status: SignOutStatus.success, responseMessage: 'Sign Out Success'));
    } catch (e) {
      emit(state.copyWith(
          status: SignOutStatus.failure, responseMessage: e.toString()));
    }
  }
}
