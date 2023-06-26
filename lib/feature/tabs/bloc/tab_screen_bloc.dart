import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/tutorial/Utils/tutorial.dart';

part 'tab_screen_state.dart';

part 'tab_screen_event.dart';

class TabScreenBloc extends Bloc<TabScreenEvent, TabScreenState> {
  TabScreenBloc({required TabPage initialTabPage})
      : super(TabScreenState(currentTabPage: initialTabPage, tutorialKeys: [
          // GlobalKey(), //* Tutorial key for Bot Details
          // GlobalKey(), //* Tutorial key for Bot Chart
          // GlobalKey(), //* Tutorial key for Chat Lora Button Tab
          TutorialJourney.botDetails,
          TutorialJourney.botChart,
          TutorialJourney.chatLoraTab,
        ])) {
    on<TabChanged>(_onTabChanged);
    on<AiButtonSelected>(_onAiButtonSelected);
    on<BackButtonClicked>(_onBackButtonClicked);
  }

  _onTabChanged(TabChanged event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(currentTabPage: event.tabPage, aiPageSelected: false));
  }

  _onAiButtonSelected(AiButtonSelected event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(aiPageSelected: true));
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
