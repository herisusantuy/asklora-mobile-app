part of '../home_screen_form.dart';

class HomePopUpMessage extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String subTitle;
  final String buttonLabel;
  final String? secondaryButtonLabel;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final String pngImage;
  final double boxTopMargin;

  const HomePopUpMessage(
      {required this.title,
      required this.subTitle,
      required this.backgroundColor,
      required this.buttonLabel,
      this.secondaryButtonLabel,
      required this.onPrimaryButtonTap,
      this.onSecondaryButtonTap,
      this.pngImage = 'lora_memoji_1',
      this.boxTopMargin = 70,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeHorizontalPadding(
      child: LoraPopUpMessage(
        backgroundColor: backgroundColor,
        title: title,
        subTitle: subTitle,
        buttonLabel: buttonLabel,
        secondaryButtonLabel: secondaryButtonLabel,
        onPrimaryButtonTap: onPrimaryButtonTap,
        onSecondaryButtonTap: onSecondaryButtonTap,
        pngImage: pngImage,
        boxTopMargin: boxTopMargin,
      ),
    );
  }
}
