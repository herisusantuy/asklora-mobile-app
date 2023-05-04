import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tabs_screen_state.dart';
part 'tabs_screen_event.dart';

class TabScreenBloc extends Bloc<TabScreenEvent, TabScreenState> {
  TabScreenBloc() : super(TabScreenState(currentIndexScreen: 0)) {
    on<TabIndexChanged>(_onChangedIndexTab);
  }

  _onChangedIndexTab(TabIndexChanged event, Emitter<TabScreenState> emit) {
    emit(state.copyWith(currentIndexScreen: event.index));
  }
}
