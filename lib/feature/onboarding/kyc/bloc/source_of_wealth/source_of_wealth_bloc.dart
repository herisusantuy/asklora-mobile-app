import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  _onSourceOfWealthSelected(
      SourceOfWealthSelected event, Emitter<SourceOfWealthState> emit) {
    int totalAmount = state.totalAmount;
    List<SourceOfWealthModel> sourceOfWealthAnswers =
        List.from(state.sourceOfWealthAnswers);
    SourceOfWealthModel? answer = sourceOfWealthAnswers.firstWhereOrNull(
        (element) => element.sourceOfWealthType == event.sourceOfWealthType);
    int divideAmount = sourceOfWealthAnswers.isNotEmpty
        ? 100 ~/ (sourceOfWealthAnswers.length + 1)
        : 100;
    if (answer == null) {
      print('selected');
      sourceOfWealthAnswers.add(SourceOfWealthModel(
        sourceOfWealthType: event.sourceOfWealthType,
        amount: divideAmount,
        isActive: true,
      ));
    } else {
      print('unselected');
      sourceOfWealthAnswers.remove(answer);
      answer = answer.copyWith(isActive: !answer.isActive);
      if (sourceOfWealthAnswers.isNotEmpty) {
        totalAmount =
            sourceOfWealthAnswers.map((e) => e.amount).reduce((a, b) => a + b);
      } else {
        totalAmount = 0;
      }
    }
    print('length >> ${sourceOfWealthAnswers.length}');
    List<int> arrayOfTotal =
        sourceOfWealthAnswers.map((e) => e.amount).toList();
    print('array of total>> $arrayOfTotal');
    print('totalAmount >> $totalAmount');

    print('divide amount>> $divideAmount');
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
    emit(state.copyWith(
      sourceOfWealthAnswers: sourceOfWealthAnswers,
    ));
  }
}
