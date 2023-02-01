part of '../custom_key_pad.dart';

class CustomDeleteKeyPad extends StatelessWidget {
  final MoneyMaskedTextController controller;
  final double width;
  final double height;

  const CustomDeleteKeyPad(
      {required this.controller,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int textLength = controller.text.length;
        String value = '';
        for (int i = 0; i < textLength; i++) {
          if (i < textLength - 1) {
            value = '$value${controller.text[i]}';
          }
        }
        controller.text = value;
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 50, minHeight: 30),
        height: height,
        width: width,
        child: const Center(
          child: Icon(
            Icons.backspace_outlined,
            color: AskLoraColors.charcoal,
          ),
        ),
      ),
    );
  }
}
