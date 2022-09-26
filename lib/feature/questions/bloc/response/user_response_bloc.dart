import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../domain/endpoint_response.dart';
import '../../domain/user_response_request.dart';
import '../../repository/question_answer_repository.dart';

part 'user_response_event.dart';

part 'user_response_state.dart';

class UserResponseBloc extends Bloc<UserResponseEvent, UserResponseState> {
  UserResponseBloc({required UserResponseRepository userResponseRepository})
      : _userResponseRepository = userResponseRepository,
        super(const UserResponseState()) {
    on<UserResponseEvent>((event, emit) {});
    on<SendResponse>(_onSendAnswer);
    on<SkipResponse>(_onSkipResponse);
    on<UpdateEndpointResponse>(_onUpdateEndpointResponse);
    on<SendBulkResponse>(_onSendBulkResponse);
  }

  final UserResponseRepository _userResponseRepository;

  void _onSendAnswer(
      SendResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(responseState: ResponseState.loading));
      var data =
          await _userResponseRepository.addAnswer(event.userResponseRequest);
      emit(state.copyWith(
          responseState: ResponseState.success, endpointResponse: data));
    } catch (e) {
      emit(state.copyWith(responseState: ResponseState.error));
    }
  }

  void _onSkipResponse(
      SkipResponse event, Emitter<UserResponseState> emit) async {
    emit(state.copyWith(responseState: ResponseState.loading));
    emit(state.copyWith(
        responseState: ResponseState.success,
        endpointResponse: state.endpointResponse));
  }

  void _onUpdateEndpointResponse(
      UpdateEndpointResponse event, Emitter<UserResponseState> emit) async {
    emit(state.copyWith(endpointResponse: event.endpointResponse));
  }

  void _onSendBulkResponse(
      SendBulkResponse event, Emitter<UserResponseState> emit) async {
    _userResponseRepository.addBulkAnswer(event.userResponseRequest);
  }
}
