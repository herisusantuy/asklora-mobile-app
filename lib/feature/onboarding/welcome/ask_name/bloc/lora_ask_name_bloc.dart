import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/UtilTest/header_util.dart';
import '../../../../../core/UtilTest/storage/shared_preference.dart';
import '../../../../../core/UtilTest/storage/storage_keys.dart';
import '../domain/add_user_name_response.dart';
import '../repository/add_user_name_repository.dart';

part 'lora_ask_name_event.dart';

part 'lora_ask_name_state.dart';

class LoraAskNameBloc extends Bloc<LoraAskNameEvent, LoraAskNameState> {
  LoraAskNameBloc(
      {required AddUserNameRepository addUserNameRepository,
      required SharedPreference sharedPreference})
      : _addUserNameRepository = addUserNameRepository,
        _sharedPreference = sharedPreference,
        super(const LoraAskNameState()) {
    on<NameChanged>(_onUsernameChanged);
    on<SubmitUserName>(_onSubmitUserName);
    on<ReSubmitUserName>(_onReSubmitUserName);
  }

  final AddUserNameRepository _addUserNameRepository;
  final SharedPreference _sharedPreference;

  void _onUsernameChanged(
    NameChanged event,
    Emitter<LoraAskNameState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  void _onSubmitUserName(
    SubmitUserName event,
    Emitter<LoraAskNameState> emit,
  ) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    try {
      final response = await submitUserName(state.name);
      emit(state.copyWith(response: response));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  void _onReSubmitUserName(
    ReSubmitUserName event,
    Emitter<LoraAskNameState> emit,
  ) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    try {
      final name = await _sharedPreference.readData(sfKeyPpiName);
      final response = await submitUserName(name!);
      emit(state.copyWith(response: response));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  Future<BaseResponse<AddUserNameResponse>> submitUserName(String name) async {
    String? deviceId = await getDeviceId();
    var response = await _addUserNameRepository.addUserName(
        name: name, deviceId: deviceId!);
    await _sharedPreference.writeData(
        sfKeyPpiAccountId, response.data!.accountId);
    await _sharedPreference.writeData(sfKeyPpiName, response.data!.name);
    await _sharedPreference.writeIntData(sfKeyPpiUserId, response.data!.id);
    return response;
  }
}
