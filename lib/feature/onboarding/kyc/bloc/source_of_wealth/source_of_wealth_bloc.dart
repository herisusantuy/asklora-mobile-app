import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/upgrade_account/wealth_sources_request.dart';
import '../../utils/source_of_wealth_enum.dart';

part 'source_of_wealth_event.dart';
part 'source_of_wealth_state.dart';

class SourceOfWealthBloc
    extends Bloc<SourceOfWealthEvent, SourceOfWealthState> {
  SourceOfWealthBloc() : super(const SourceOfWealthState()) {
    on<SourceOfWealthSelected>(_onSourceOfWealthSelected);
    on<SourceOfWealthAmountChanged>(_onSourceOfWealthAmountChanged);
    on<SourceOfWealthIncrementAmountChanged>(
        _onSourceOfWealthIncrementAmountChanged);
    on<SourceOfWealthDecrementAmountChanged>(
        _onSourceOfWealthDecrementAmountChanged);
    on<SourceOfWealthOtherIncomeChanged>(_onSourceOfWealthOtherIncomeChanged);
    on<InitiateSourceOfWealth>(_onInitiateSourceOfWealth);
    on<SubmitSourceOfWealth>(_onSubmitSourceOfWealth);
  }

  _onSourceOfWealthSelected(
      SourceOfWealthSelected event, Emitter<SourceOfWealthState> emit) {
    int totalAmount = state.totalAmount;
    List<SourceOfWealthModel> sourceOfWealthAnswers =
        List.from(state.sourceOfWealthAnswers);
    SourceOfWealthModel? answer = sourceOfWealthAnswers.firstWhereOrNull(
        (element) => element.sourceOfWealthType == event.sourceOfWealthType);

    if (answer == null) {
      sourceOfWealthAnswers.add(SourceOfWealthModel(
        sourceOfWealthType: event.sourceOfWealthType,
        amount: state.totalAmount == 0 ? 100 : 0,
        isActive: true,
      ));
    } else {
      sourceOfWealthAnswers.remove(answer);
      if (sourceOfWealthAnswers.isNotEmpty) {
        totalAmount =
            sourceOfWealthAnswers.map((e) => e.amount).reduce((a, b) => a + b);
      } else {
        totalAmount = 0;
      }
    }
    emit(
      state.copyWith(
        sourceOfWealthAnswers: sourceOfWealthAnswers,
        totalAmount: totalAmount,
      ),
    );
  }

  _onSourceOfWealthAmountChanged(
      SourceOfWealthAmountChanged event, Emitter<SourceOfWealthState> emit) {
    List<SourceOfWealthModel> sourceOfWealthAnswers =
        List.from(state.sourceOfWealthAnswers);
    int index = sourceOfWealthAnswers.indexWhere(
        (element) => element.sourceOfWealthType == event.sourceOfWealthType);
    if (index >= 0) {
      sourceOfWealthAnswers[index] = sourceOfWealthAnswers[index]
          .copyWith(amount: int.parse(event.wealthAmount));
      int totalAmount =
          sourceOfWealthAnswers.map((e) => e.amount).reduce((a, b) => a + b);

      emit(
        state.copyWith(
          sourceOfWealthAnswers: sourceOfWealthAnswers,
          totalAmount: totalAmount,
        ),
      );
    }
  }

  _onSourceOfWealthIncrementAmountChanged(
      SourceOfWealthIncrementAmountChanged event,
      Emitter<SourceOfWealthState> emit) {
    List<SourceOfWealthModel> sourceOfWealthAnswers =
        List.from(state.sourceOfWealthAnswers);

    var answer = sourceOfWealthAnswers.firstWhere(
        (element) => element.sourceOfWealthType == event.sourceOfWealthType);

    if (answer.amount < 0) {
      answer = answer.copyWith(amount: 10);
    }

    int index = sourceOfWealthAnswers.indexWhere(
        (element) => element.sourceOfWealthType == event.sourceOfWealthType);

    sourceOfWealthAnswers[index] = answer.copyWith(amount: answer.amount + 10);
    int totalAmount =
        sourceOfWealthAnswers.map((e) => e.amount).reduce((a, b) => a + b);
    emit(
      state.copyWith(
        sourceOfWealthAnswers: sourceOfWealthAnswers,
        totalAmount: totalAmount,
      ),
    );
  }

  _onSourceOfWealthDecrementAmountChanged(
      SourceOfWealthDecrementAmountChanged event,
      Emitter<SourceOfWealthState> emit) {
    List<SourceOfWealthModel> sourceOfWealthAnswers =
        List.from(state.sourceOfWealthAnswers);
    var answer = sourceOfWealthAnswers.firstWhere(
        (element) => element.sourceOfWealthType == event.sourceOfWealthType);

    int index = sourceOfWealthAnswers.indexWhere(
        (element) => element.sourceOfWealthType == event.sourceOfWealthType);

    sourceOfWealthAnswers[index] =
        answer.copyWith(amount: answer.amount < 10 ? 0 : answer.amount - 10);
    int totalAmount =
        sourceOfWealthAnswers.map((e) => e.amount).reduce((a, b) => a + b);

    emit(
      state.copyWith(
        sourceOfWealthAnswers: sourceOfWealthAnswers,
        totalAmount: totalAmount,
      ),
    );
  }

  _onSourceOfWealthOtherIncomeChanged(SourceOfWealthOtherIncomeChanged event,
      Emitter<SourceOfWealthState> emit) {
    List<SourceOfWealthModel> sourceOfWealthAnswers =
        List.from(state.sourceOfWealthAnswers);
    int indexOfOtherIncome = sourceOfWealthAnswers.indexWhere(
        (element) => element.sourceOfWealthType == SourceOfWealthType.other);
    sourceOfWealthAnswers[indexOfOtherIncome] =
        sourceOfWealthAnswers[indexOfOtherIncome]
            .copyWith(additionalSourceOfWealth: event.otherIncome);
    if (event.otherIncome.isEmpty) {
      emit(state.copyWith(
          errorMessage: 'Please enter more details',
          sourceOfWealthAnswers: sourceOfWealthAnswers));
    } else {
      emit(state.copyWith(
          sourceOfWealthAnswers: sourceOfWealthAnswers, errorMessage: ''));
    }
  }

  _onInitiateSourceOfWealth(
      InitiateSourceOfWealth event, Emitter<SourceOfWealthState> emit) {
    emit(state.copyWith(
      sourceOfWealthAnswers: event.sourceOfWealthRequest
          ?.map((e) => SourceOfWealthModel(
                sourceOfWealthType: SourceOfWealthType.findByStringValue(
                        e.wealthSource ?? '') ??
                    SourceOfWealthType.other,
                amount: e.percentage ?? 0,
                isActive: true,
              ))
          .toList(),
    ));
  }

  _onSubmitSourceOfWealth(
      SubmitSourceOfWealth event, Emitter<SourceOfWealthState> emit) {
    if (state.sourceOfWealthAnswers.map((e) => e.amount).contains(0)) {
      print('source of wealth list: ${state.sourceOfWealthAnswers}');
      emit(state.copyWith(
          isShowPopupMessage: true,
          errorPopupMessage:
              'Please add percentage amount in list that you selected'));
    }
    if (state.totalAmount != 100) {
      emit(state.copyWith(
          isShowPopupMessage: true,
          errorPopupMessage: 'Your sources of wealth must add up to 100%'));
    }
    if (state.sourceOfWealthAnswers
        .map((e) =>
            e.sourceOfWealthType == SourceOfWealthType.other &&
            (e.additionalSourceOfWealth == null ||
                e.additionalSourceOfWealth == ''))
        .contains(true)) {
      emit(state.copyWith(errorMessage: 'Please enter more details'));
    } else {
      emit(state.copyWith(
          isShowPopupMessage: false, errorMessage: '', errorPopupMessage: ''));
    }
  }
}
