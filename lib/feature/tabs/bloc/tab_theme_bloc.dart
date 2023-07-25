import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/asklora_colors.dart';

part 'tab_theme_event.dart';

part 'tab_theme_state.dart';

class TabThemeBloc extends Bloc<TabThemeEvent, TabThemeState> {
  TabThemeBloc({BackgroundImageType? backgroundImageType})
      : super(TabThemeState(
            backgroundImageType:
                backgroundImageType ?? BackgroundImageType.none)) {
    on<BackgroundImageTypeChanged>(_onBackgroundImageTypeChanged);
  }

  _onBackgroundImageTypeChanged(
          BackgroundImageTypeChanged event, Emitter<TabThemeState> emit) =>
      emit(state.copyWith(
        backgroundImageType: event.backgroundImageType,
      ));
}
