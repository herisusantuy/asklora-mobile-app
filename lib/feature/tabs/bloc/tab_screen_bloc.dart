import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_screen_state.dart';

part 'tab_screen_event.dart';

class TabScreenBloc extends Bloc<TabScreenEvent, TabScreenState> {
  TabScreenBloc({required TabPage initialTabPage})
      : super(TabScreenState(currentTabPage: initialTabPage)) {
    on<TabChanged>(_onTabChanged);
    on<AiButtonSelected>(_onAiButtonSelected);
  }

  _onTabChanged(TabChanged event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(currentTabPage: event.tabPage, aiPageSelected: false));
  }

  _onAiButtonSelected(AiButtonSelected event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(aiPageSelected: true));
  }
}
