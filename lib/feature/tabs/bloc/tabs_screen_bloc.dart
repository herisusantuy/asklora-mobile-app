import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tabs_screen_state.dart';
part 'tabs_screen_event.dart';

class TabScreenBloc extends Bloc<TabScreenEvent, TabScreenState> {
  TabScreenBloc() : super(const TabScreenState(currentIndexScreen: 0)) {
    on<TabIndexChanged>(_onChangedIndexTab);
    on<BackButtonClickedOnce>(_onOnceClickBackButton);
  }

  _onChangedIndexTab(TabIndexChanged event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(currentIndexScreen: event.index));
  }

  _onOnceClickBackButton(
      BackButtonClickedOnce event, Emitter<TabScreenState> emit) async {
    emit(state.copyWith(isShowConfirmationBack: true));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(isShowConfirmationBack: false));
  }
}
