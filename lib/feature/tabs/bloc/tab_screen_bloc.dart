import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_screen_event.dart';

part 'tab_screen_state.dart';

class TabScreenBloc extends Bloc<TabScreenEvent, TabScreenState> {
  TabScreenBloc({required TabPage initialTabPage})
      : super(TabScreenState(currentTabPage: initialTabPage)) {
    on<TabChanged>(_onTabChanged);
    on<OpenAiOverlay>(_onAiButtonSelected);
    on<CloseAiOverLay>(_onCloseAiOverlay);
    on<BackButtonClicked>(_onBackButtonClicked);
  }

  _onTabChanged(TabChanged event, Emitter<TabScreenState> emit) {
    if (state.currentTabPage != event.tabPage) {
      //Remove the data when tab change.
      state.currentTabPage.setData();
    }
    emit(state.copyWith(currentTabPage: event.tabPage, aiPageSelected: false));
  }

  _onAiButtonSelected(OpenAiOverlay event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(aiPageSelected: true));
  }

  _onCloseAiOverlay(CloseAiOverLay event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(aiPageSelected: false));
  }

  _onBackButtonClicked(
      BackButtonClicked event, Emitter<TabScreenState> emit) async {
    if (state.tabScreenBackState == TabScreenBackState.none) {
      emit(state.copyWith(
          tabScreenBackState: TabScreenBackState.openConfirmation));
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(tabScreenBackState: TabScreenBackState.none));
    } else if (state.tabScreenBackState ==
        TabScreenBackState.openConfirmation) {
      emit(state.copyWith(tabScreenBackState: TabScreenBackState.closeApp));
    }
  }
}
