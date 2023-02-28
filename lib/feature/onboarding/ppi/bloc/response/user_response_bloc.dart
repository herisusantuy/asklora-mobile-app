import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/domain/triplet.dart';
import '../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../core/utils/storage/storage_keys.dart';
import '../../domain/ppi_user_response.dart';
import '../../domain/ppi_user_response_request.dart';
import '../../domain/question.dart';
import '../../repository/ppi_response_repository.dart';

part 'user_response_event.dart';

part 'user_response_state.dart';

class UserResponseBloc extends Bloc<UserResponseEvent, UserResponseState> {
  UserResponseBloc(
      {required PpiResponseRepository ppiResponseRepository,
      required SharedPreference sharedPreference})
      : _ppiResponseRepository = ppiResponseRepository,
        _sharedPreference = sharedPreference,
        super(UserResponseState(userResponse: List.empty(growable: true))) {
    on<UserResponseEvent>((event, emit) {});
    on<SendResponse>(_onSendAnswer);
    on<SkipResponse>(_onSkipResponse);
    on<UpdatePpiUserResponse>(_onUpdatePpiUserResponse);
    on<SendBulkResponse>(_onSendBulkResponse);
    on<SaveUserResponse>(_onUserResponseSave);
    on<SaveOmniSearchResponse>(_onSaveOmniSearchResponse);
    on<CalculateScore>(_onCalculateScore);
  }

  final PpiResponseRepository _ppiResponseRepository;
  final SharedPreference _sharedPreference;

  void _onSendAnswer(
      SendResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(responseState: ResponseState.loading));

      await _ppiResponseRepository.addAnswer(event.ppiUserResponseRequest);
      emit(state.copyWith(
        responseState: ResponseState.success,
      ));
    } catch (e) {
      emit(state.copyWith(responseState: ResponseState.error));
    }
  }

  void _onUserResponseSave(
      SaveUserResponse event, Emitter<UserResponseState> emit) async {
    emit(state.copyWith(
        ppiResponseState: PpiResponseState.initAddResponse,
        responseState: ResponseState.loading));

    state.userResponse
        ?.removeWhere((element) => element.left == event.question.questionId);
    state.userResponse?.add(Triplet(
        event.question.questionId!, event.question, event.selectedAnswer));

    emit(state.copyWith(
        ppiResponseState: PpiResponseState.finishAddResponse,
        responseState: ResponseState.success));
  }

  void _onSaveOmniSearchResponse(
      SaveOmniSearchResponse event, Emitter<UserResponseState> emit) async {
    emit(state.copyWith(
        ppiResponseState: PpiResponseState.initAddResponse,
        responseState: ResponseState.loading));

    state.cachedDefaultChoices = List.from(event.cachedDefaultChoices);
    state.cachedSelectedChoices = List.from(event.cachedSelectedChoices);
    emit(state.copyWith(
        ppiResponseState: PpiResponseState.finishAddResponse,
        responseState: ResponseState.success));
  }

  void _onSkipResponse(
      SkipResponse event, Emitter<UserResponseState> emit) async {
    emit(state.copyWith(responseState: ResponseState.loading));
    emit(state.copyWith(responseState: ResponseState.success));
  }

  void _onUpdatePpiUserResponse(
      UpdatePpiUserResponse event, Emitter<UserResponseState> emit) async {
    emit(state);
  }

  void _onCalculateScore(
      CalculateScore event, Emitter<UserResponseState> emit) async {
    final result = await state.isNotEligible();
    emit(ScoreCalculation(isUserIsNotEligible: result));
  }

  void _onSendBulkResponse(
      SendBulkResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(
        responseState: ResponseState.loading,
        ppiResponseState: PpiResponseState.dispatchResponse,
      ));

      final tempId = await _sharedPreference.readIntData(sfKeyTempId) ?? 0;

      var requests = state.getAllSelectionsInRequest(tempId);

      await _ppiResponseRepository.addBulkAnswer(requests);
      var userSnapShot = await _ppiResponseRepository.getUserSnapShot(tempId);

      emit(state.copyWith(
        responseState: ResponseState.success,
        ppiResponseState: PpiResponseState.dispatchResponse,
        snapShot: userSnapShot,
      ));
    } catch (e) {
      emit(state.copyWith(
        responseState: ResponseState.error,
        ppiResponseState: PpiResponseState.dispatchResponse,
      ));
    }
  }
}
