import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'back_button_interceptor_event.dart';

part 'back_button_interceptor_state.dart';

class BackButtonInterceptorBloc
    extends Bloc<BackButtonInterceptorEvent, BackButtonInterceptorState> {
  BackButtonInterceptorBloc() : super(BackButtonInterceptorInitial()) {
    on<InitiateInterceptor>(_onInitiateInterceptor);
    on<RemoveInterceptor>(_onRemoveInterceptor);
    on<OnPressedBackInterceptor>(_onPressedBackInterceptor);
  }

  void _onInitiateInterceptor(
      InitiateInterceptor event, Emitter<BackButtonInterceptorState> emit) {
    BackButtonInterceptor.add(interceptor);
  }

  void _onPressedBackInterceptor(OnPressedBackInterceptor event,
      Emitter<BackButtonInterceptorState> emit) {
    emit(OnPressedBack());
    emit(BackButtonInterceptorInitial());
  }

  void _onRemoveInterceptor(
      RemoveInterceptor event, Emitter<BackButtonInterceptorState> emit) {
    BackButtonInterceptor.removeAll();
  }

  bool interceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    add(OnPressedBackInterceptor());
    return true;
  }

  @override
  Future<void> close() {
    BackButtonInterceptor.remove(interceptor);
    return super.close();
  }
}
