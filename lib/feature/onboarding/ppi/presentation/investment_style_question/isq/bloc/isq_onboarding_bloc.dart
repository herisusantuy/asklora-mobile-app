import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/domain/base_response.dart';
import '../../../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../../../core/utils/storage/storage_keys.dart';

part 'isq_onboarding_event.dart';

part 'isq_onboarding_state.dart';

class IsqOnBoardingBloc extends Bloc<IsqOnBoardingEvent, IsqOnBoardingState> {
  final SharedPreference _sharedPreference;

  IsqOnBoardingBloc({required SharedPreference sharedPreference})
      : _sharedPreference = sharedPreference,
        super(const IsqOnBoardingState()) {
    on<GetAiWelcomeScreenStatus>(_onGetAiWelcomeScreenStatus);
    on<UpdateAiWelcomeScreenStatus>(_onUpdateAiWelcomeScreenStatus);
  }

  void _onGetAiWelcomeScreenStatus(
      GetAiWelcomeScreenStatus event, Emitter<IsqOnBoardingState> emit) async {
    emit(state.copyWith(isqOnboardingResponseState: ResponseState.loading));

    bool aiWelcomeScreenStatus =
        await _sharedPreference.readBoolData(StorageKeys.sfAiWelcomeScreen) ??
            false;

    emit(state.copyWith(
        aiWelcomeScreenStatus: aiWelcomeScreenStatus,
        isqOnboardingResponseState: ResponseState.success));
  }

  void _onUpdateAiWelcomeScreenStatus(UpdateAiWelcomeScreenStatus event,
      Emitter<IsqOnBoardingState> emit) async {
    await _sharedPreference.writeBoolData(
        StorageKeys.sfAiWelcomeScreen, event.aiWelcomeScreenStatus);
    emit(state.copyWith(aiWelcomeScreenStatus: event.aiWelcomeScreenStatus));
  }
}
