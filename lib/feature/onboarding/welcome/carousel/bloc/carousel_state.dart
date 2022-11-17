part of 'carousel_bloc.dart';

class CarouselState extends Equatable {
  final int carouselIndex;

  const CarouselState({this.carouselIndex = 0});

  @override
  List<Object> get props => [carouselIndex];

  CarouselState copyWith({
    int? carouselIndex,
  }) {
    return CarouselState(
      carouselIndex: carouselIndex ?? this.carouselIndex,
    );
  }
}
