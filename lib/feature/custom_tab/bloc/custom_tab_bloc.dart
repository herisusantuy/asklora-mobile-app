import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_tab_state.dart';

part 'custom_tab_event.dart';

class CustomTabBloc extends Bloc<CustomTabEvent, CustomTabState> {
  CustomTabBloc({required TabPage initialTabPage})
      : super(CustomTabState(currentTabPage: initialTabPage)) {
    on<TabChanged>(_onTabChanged);
    on<AiButtonSelected>(_onAiButtonSelected);
  }

  _onTabChanged(TabChanged event, Emitter<CustomTabState> emit) {
    emit(state.copyWith(currentTabPage: event.tabPage, aiPageSelected: false));
  }

  _onAiButtonSelected(AiButtonSelected event, Emitter<CustomTabState> emit) {
    emit(state.copyWith(aiPageSelected: true));
  }
}
