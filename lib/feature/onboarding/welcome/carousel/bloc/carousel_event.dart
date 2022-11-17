part of 'carousel_bloc.dart';

abstract class CarouselEvent extends Equatable {
  const CarouselEvent() : super();

  @override
  List<Object?> get props => [];
}

class CarouselIndexChanged extends CarouselEvent {
  final int carouselIndex;
  const CarouselIndexChanged({required this.carouselIndex});
}
