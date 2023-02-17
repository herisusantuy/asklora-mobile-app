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
        super(UserResponseState(userResponse: List.empty(growable: true))) {
    on<UserResponseEvent>((event, emit) {});
    on<SendResponse>(_onSendAnswer);
    on<SkipResponse>(_onSkipResponse);
    on<UpdatePpiUserResponse>(_onUpdatePpiUserResponse);
    on<SendBulkResponse>(_onSendBulkResponse);
    on<SaveUserResponse>(_onUserResponseSave);
    on<SaveOmniSearchResponse>(_onSaveOmniSearchResponse);
  }

  final PpiResponseRepository _ppiResponseRepository;

  void _onSendAnswer(
      SendResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(responseState: ResponseState.loading));
      var data =
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
    // emit(state.copyWith(
    //     ppiResponseState: PpiResponseState.initAddResponse,
    //     responseState: ResponseState.loading));

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

    debugPrint(
        'Krishna user_response_bloc ${event.cachedDefaultChoices} ${event.cachedSelectedChoices}');
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

  void _onSendBulkResponse(
      SendBulkResponse event, Emitter<UserResponseState> emit) async {
    try {
      emit(state.copyWith(
        responseState: ResponseState.loading,
        ppiResponseState: PpiResponseState.dispatchResponse,
      ));
      var requests = state.getAllSelectionsInRequest();

      debugPrint('Krishna user_response_bloc ${requests}');

      var data = await _ppiResponseRepository.addBulkAnswer(requests);
      var userSnapShot = await _ppiResponseRepository.getUserSnapShot(1);

      debugPrint(
          'Krishna user_response_bloc sending data${userSnapShot.toString()}');

      // await Future.delayed(const Duration(milliseconds: 500));

      debugPrint('Krishna user_response_bloc done');
      emit(state.copyWith(
        responseState: ResponseState.success,
        ppiResponseState: PpiResponseState.dispatchResponse,
      ));
    } catch (e) {
      emit(state.copyWith(
        responseState: ResponseState.error,
        ppiResponseState: PpiResponseState.dispatchResponse,
      ));
    }
  }
}
