import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'carousel_event.dart';

part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(const CarouselState()) {
    on<CarouselIndexChanged>(_onCarouselIndexChanged);
  }

  void _onCarouselIndexChanged(
      CarouselIndexChanged event, Emitter<CarouselState> emit) async {
    emit(state.copyWith(carouselIndex: event.carouselIndex));
  }
}
