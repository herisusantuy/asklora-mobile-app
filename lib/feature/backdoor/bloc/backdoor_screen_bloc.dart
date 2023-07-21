import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/build_configs/build_config.dart';
import '../domain/backdoor_repository.dart';

part 'backdoor_screen_event.dart';

part 'backdoor_screen_state.dart';

class BackdoorScreenBloc
    extends Bloc<BackdoorScreenEvent, BackdoorScreenState> {
  BackdoorScreenBloc(this._backdoorRepository)
      : super(const BackdoorScreenState()) {
    on<OnBaseUrlChanged>(_onBaseUrlChange);
  }

  final BackdoorRepository _backdoorRepository;

  void _onBaseUrlChange(
      OnBaseUrlChanged event, Emitter<BackdoorScreenState> emit) async {
    emit(state.copyWith(baseUrl: event.baseUrl));
    await _backdoorRepository.saveBaseUrl(event.baseUrl);

    if (Environment().config is DevConfig) {
      var config = Environment().config;
      (config as DevConfig).backDoorBaseUrl = event.baseUrl;
    }
  }
}
