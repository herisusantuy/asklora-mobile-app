import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../../onboarding/ppi/domain/ppi_api_repository.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PpiApiRepository _ppiApiRepository;
  final SharedPreference _sharedPreference;

  HomeScreenBloc(
      {required PpiApiRepository ppiApiRepository,
      required SharedPreference sharedPreference})
      : _ppiApiRepository = ppiApiRepository,
        _sharedPreference = sharedPreference,
        super(const HomeScreenState()) {
    on<GetUserSnapShots>(_onGetUserSnapshots);
  }

  _onGetUserSnapshots(
      GetUserSnapShots event, Emitter<HomeScreenState> emit) async {
    try {
      var accountId = await _sharedPreference.readIntData(sfKeyTempId) ?? 0;
      var response = await _ppiApiRepository.getUserSnapshot(accountId);
      emit(state.copyWith(response: BaseResponse.loading()));
      emit(state.copyWith(
          response: BaseResponse.complete(SnapShot.fromJson(response.data))));
    } catch (_) {
      emit(state.copyWith(response: BaseResponse.error('Failed to get data')));
    }
  }
}
