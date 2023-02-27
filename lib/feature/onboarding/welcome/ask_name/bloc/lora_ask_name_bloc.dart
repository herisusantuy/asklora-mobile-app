import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/header_util.dart';
import '../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../core/utils/storage/storage_keys.dart';
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
    String? deviceId = await getDeviceId();
    try {
      var response = await _addUserNameRepository.addUserName(
          name: state.name, deviceId: deviceId!);
      await _sharedPreference.writeData(
          sfKeyTempName, response.data!.accountId);
      await _sharedPreference.writeIntData(sfKeyTempId, response.data!.id);
      emit(state.copyWith(response: BaseResponse.complete(response.data)));
    } catch (e) {
      emit(state.copyWith(
          response: BaseResponse.error('Something went wrong!')));
    }
  }
}
