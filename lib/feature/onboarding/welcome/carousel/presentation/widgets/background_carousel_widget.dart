part of '../carousel_screen.dart';

class BackgroundCarouselWidget extends StatelessWidget {
  BackgroundCarouselWidget({Key? key}) : super(key: key);

  final List<CarouselModel> _carouselItems = [
    CarouselModel(title: 'Get Your Investment In Shape', imageAsset: '1'),
    CarouselModel(title: 'Guide By AI Coach Lora', imageAsset: '2'),
    CarouselModel(title: 'Personalized Experience', imageAsset: '3'),
    CarouselModel(title: 'Trade With Ease And Strategy', imageAsset: '4'),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      key: const Key('background_carousel_slider'),
      options: CarouselOptions(
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height,
        enlargeCenterPage: false,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
      items: _carouselItems
          .map((carouselModel) => CarouselItem(
          title: carouselModel.title,
          imageAsset: carouselModel.imageAsset))
          .toList(),
    );
  }
}
