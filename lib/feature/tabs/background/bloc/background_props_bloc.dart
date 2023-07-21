import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'background_props_event.dart';

part 'background_props_state.dart';

class BackgroundPropsBloc
    extends Bloc<BackgroundPropsEvent, BackgroundPropsState> {
  BackgroundPropsBloc({BackgroundImageType? backgroundImageType})
      : super(BackgroundPropsState(
            backgroundImageType:
                backgroundImageType ?? BackgroundImageType.none)) {
    on<BackgroundImageTypeChanged>(_onBackgroundImageTypeChanged);
  }

  _onBackgroundImageTypeChanged(BackgroundImageTypeChanged event,
          Emitter<BackgroundPropsState> emit) =>
      emit(state.copyWith(
        backgroundImageType: event.backgroundImageType,
      ));
}
