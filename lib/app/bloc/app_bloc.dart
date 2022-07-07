import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/token_validator.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final TokenValidator _tokenValidator;

  AppBloc({
    required TokenValidator tokenValidator,
  })  : _tokenValidator = tokenValidator,
        super(const AppState.unknown()) {
    on<AppLaunched>(_onAppLaunched);
  }

  void _onAppLaunched(AppLaunched event, Emitter<AppState> emit) async {
    bool isTokenValid = await _tokenValidator.isTokenValid();

    if (isTokenValid) {
      emit(const AppState.authenticated());
    } else {
      emit(const AppState.unauthenticated());
    }
  }
}
