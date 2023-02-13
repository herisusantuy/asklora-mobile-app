import 'dart:ui';

class LoraPopUpMessageModel {
  final String title;
  final String subTitle;
  final String buttonLabel;
  final VoidCallback onTap;

  LoraPopUpMessageModel(
      {required this.title,
      required this.subTitle,
      required this.buttonLabel,
      required this.onTap});
}
