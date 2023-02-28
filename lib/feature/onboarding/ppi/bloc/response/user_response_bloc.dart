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
    emit(state.copyWith(
      responseState: ResponseState.loading,
      ppiResponseState: PpiResponseState.calculate,
    ));
    final result = await _isNotEligible();
    emit(state.copyWith(
      responseState: result ? ResponseState.error : ResponseState.success,
      ppiResponseState: PpiResponseState.calculate,
    ));
  }

  void _onSendBulkResponse(
      SendBulkResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(
        responseState: ResponseState.loading,
        ppiResponseState: PpiResponseState.dispatchResponse,
      ));

      final tempId = await _sharedPreference.readIntData(sfKeyTempId) ?? 0;

      var requests = _getAllSelectionsInRequest(tempId);

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

  Future<bool> _isNotEligible() async {
    final scores = await _calculate();
    return scores.left < 3 || scores.right < 3;
  }

  /// Assuming the last index (4) is for age. In case anything changes happen
  /// in the PPI questioner we need to update this logic.
  /// References:
  ///   A5 -> Age,
  ///   3rd index of list is "Risk Level" question.
  ///   4th index of list is age question.
  ///   Calculation Reference: https://loratechai.atlassian.net/wiki/spaces/SPD/pages/1144619026/PPI+Calculation
  /// Returns a Pair<Suitability Score, Objective Score> of Suitability Score and Objective Score
  Future<Pair<num, num>> _calculate() {
    if (state.userResponse != null && state.userResponse!.isNotEmpty) {
      final int age = int.parse(state.userResponse![4].right);
      final List<num> scores = List.empty(growable: true);

      for (var e in state.userResponse!) {
        String? score = e.middle.choices
                ?.firstWhereOrNull(
                    (element) => element.id.toString() == e.right)
                ?.score ??
            '0';
        scores.add(num.parse(score));
      }

      var ageScore = (6 - pow(age / 35, 2));

      ageScore = ageScore <= 1
          ? 1
          : ageScore >= 5.5
              ? 5.5
              : ageScore;

      scores.removeWhere((element) => element == 0);
      scores.add(ageScore);

      final mean = scores.reduce((a, b) => a + b) / scores.length;

      final maxOfScores = scores.reduce(max);

      var suitabilityScore = mean + maxOfScores / 2;

      final objectiveScore = scores[3];

      suitabilityScore = min(suitabilityScore, (objectiveScore + 0.5));

      return Future.value(Pair(suitabilityScore, objectiveScore));
    } else {
      return Future.value(Pair(0, 0));
    }
  }

  List<PpiSelectionRequest> _getAllSelectionsInRequest(int id) =>
      state.userResponse
          ?.map((e) => PpiSelectionRequest(
              questionId: e.left, userId: id, answer: e.right))
          .toList() ??
      [];
}
