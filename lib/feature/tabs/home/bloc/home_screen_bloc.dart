import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../onboarding/ppi/repository/ppi_response_repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PpiResponseRepository _ppiResponseRepository;
  final SharedPreference _sharedPreference;

  HomeScreenBloc(
      {required PpiResponseRepository ppiResponseRepository,
      required SharedPreference sharedPreference})
      : _ppiResponseRepository = ppiResponseRepository,
        _sharedPreference = sharedPreference,
        super(const HomeScreenState()) {
    on<GetUserSnapShots>(_onGetUserSnapshots);
  }

  _onGetUserSnapshots(
      GetUserSnapShots event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var askloraId = await _sharedPreference.readIntData(sfKeyAskloraId);
    var response =
        await _ppiResponseRepository.getUserSnapshotByAskloraId(askloraId ?? 0);
    if (askloraId != 0) {
      emit(state.copyWith(response: response));
    }
  }
}
