import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/repository.dart';
import '../repository/sign_out_repository.dart';

part 'sign_out_event.dart';

part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc(
      {required Repository tokenRepository,
      required SignOutRepository signOutRepository})
      : _tokenRepository = tokenRepository,
        _signOutRepository = signOutRepository,
        super(const SignOutState()) {
    on<SignOutSubmitted>(_onSignOutSubmitted);
  }

  final Repository _tokenRepository;
  final SignOutRepository _signOutRepository;

  void _onSignOutSubmitted(
    SignOutSubmitted event,
    Emitter<SignOutState> emit,
  ) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var isSignedOut = await _signOutRepository
          .signOut(await _tokenRepository.getRefreshToken());
      if (isSignedOut) {
        await _tokenRepository.deleteAll();
        emit(state.copyWith(
            response: BaseResponse.complete('Sign Out Success')));
      } else {
        emit(state.copyWith(
            response: BaseResponse.error('Not able to sign-out!')));
      }
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(e.toString())));
    }
  }
}
