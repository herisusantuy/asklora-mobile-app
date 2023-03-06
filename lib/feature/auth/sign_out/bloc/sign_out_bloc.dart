import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/repository.dart';
import '../../../../core/utils/storage/secure_storage.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../repository/sign_out_repository.dart';

part 'sign_out_event.dart';

part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc({
    required Repository tokenRepository,
    required SignOutRepository signOutRepository,
    required SharedPreference sharedPreference,
    required SecureStorage secureStorage,
  })  : _tokenRepository = tokenRepository,
        _signOutRepository = signOutRepository,
        _sharedPreference = sharedPreference,
        _secureStorage = secureStorage,
        super(const SignOutState()) {
    on<SignOutSubmitted>(_onSignOutSubmitted);
  }

  final Repository _tokenRepository;
  final SignOutRepository _signOutRepository;
  final SharedPreference _sharedPreference;
  final SecureStorage _secureStorage;

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
        await _sharedPreference.deleteAllData();
        await _secureStorage.deleteAllData();
        emit(state.copyWith(
            response: BaseResponse.complete('Sign Out Success')));
      } else {
        emit(state.copyWith(
            response: BaseResponse.error(message: 'Not able to sign-out!')));
      }
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(message: e.toString())));
    }
  }
}
