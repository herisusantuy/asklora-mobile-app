part of '../carousel_screen.dart';

class CarouselItem extends StatelessWidget {
  final String title;
  final String imageAsset;

  const CarouselItem({required this.title, required this.imageAsset, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CustomText('-Background Image $imageAsset-'),
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 88, left: 16, right: 16),
          child: CustomTextNew(
            title,
            fontWeight: FontWeight.w900,
            fontSize: 48,
            color: AskLoraColors.charcoal,
          ),
        )),
      ],
    );
  }
}
