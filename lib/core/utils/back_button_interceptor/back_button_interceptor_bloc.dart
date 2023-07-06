import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'back_button_interceptor_event.dart';

part 'back_button_interceptor_state.dart';

class BackButtonInterceptorBloc
    extends Bloc<BackButtonInterceptorEvent, BackButtonInterceptorState> {
  BackButtonInterceptorBloc() : super(BackButtonInterceptorInitial()) {
    on<BackButtonInterceptorEvent>(_onBackPressed);

    BackButtonInterceptor.add(interceptor);
  }

  void _onBackPressed(BackButtonInterceptorEvent event,
      Emitter<BackButtonInterceptorState> emit) {
    emit(OnPressedBack());
  }

  bool interceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    add(const BackButtonInterceptorEvent());
    return true;
  }

  @override
  Future<void> close() {
    BackButtonInterceptor.remove(interceptor);
    return super.close();
  }
}
