import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/triplet.dart';
import '../../domain/ppi_user_response.dart';
import '../../domain/ppi_user_response_request.dart';
import '../../domain/question.dart';
import '../../repository/ppi_response_repository.dart';

part 'user_response_event.dart';

part 'user_response_state.dart';

class UserResponseBloc extends Bloc<UserResponseEvent, UserResponseState> {
  UserResponseBloc({required PpiResponseRepository ppiResponseRepository})
      : _ppiResponseRepository = ppiResponseRepository,
        super(UserResponseState(test: List.empty(growable: true))) {
    on<UserResponseEvent>((event, emit) {});
    on<SendResponse>(_onSendAnswer);
    on<SkipResponse>(_onSkipResponse);
    on<UpdateppiUserResponse>(_onUpdatePpiUserResponse);
    on<SendBulkResponse>(_onSendBulkResponse);
    on<SaveUserResponse>(_onUserResponseSave);
  }

  final PpiResponseRepository _ppiResponseRepository;

  void _onSendAnswer(
      SendResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(responseState: ResponseState.loading));
      var data =
          await _ppiResponseRepository.addAnswer(event.ppiUserResponseRequest);
      emit(state.copyWith(
          responseState: ResponseState.success, ppiUserResponse: data));
    } catch (e) {
      emit(state.copyWith(responseState: ResponseState.error));
    }
  }

  void _onUserResponseSave(
      SaveUserResponse event, Emitter<UserResponseState> emit) async {
    debugPrint('Krishna _onUserResponseSave before ${event.selectedAnswer} ');

    // state.test?.add(Triplet(
    //     event.question.questionId!, event.question, event.selectedAnswer));
    // event.question.copyWith(selectedOption: event.selectedAnswer);

    // debugPrint('Krishna _onUserResponseSave after ${event.question.selectedOption} ');
    // var isSaved = await event.question.save();
    emit(state.copyWith(
        responseState: true ? ResponseState.success : ResponseState.error));
  }

  void _onSkipResponse(
      SkipResponse event, Emitter<UserResponseState> emit) async {
    emit(state.copyWith(responseState: ResponseState.loading));
    emit(state.copyWith(
        responseState: ResponseState.success,
        ppiUserResponse: state.ppiUserResponse));
  }

  void _onUpdatePpiUserResponse(
      UpdateppiUserResponse event, Emitter<UserResponseState> emit) async {
    emit(state.copyWith(ppiUserResponse: event.ppiUserResponse));
  }

  void _onSendBulkResponse(
      SendBulkResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(responseState: ResponseState.loading));
      var data = await _ppiResponseRepository
          .addBulkAnswer(event.ppiUserResponseRequest);
      emit(state.copyWith(
          responseState: ResponseState.success, ppiUserResponse: data));
    } catch (e) {
      emit(state.copyWith(responseState: ResponseState.error));
    }
  }
}
