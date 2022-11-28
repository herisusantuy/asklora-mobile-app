import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/we_create/custom_linear_progress_indicator.dart';

class KycBaseForm extends StatelessWidget {
  final String title;
  final Widget content;
  final Function()? onTapBack;
  final Widget? bottomButton;
  final double progress;

  const KycBaseForm(
      {required this.title,
      required this.content,
      required this.progress,
      this.onTapBack,
      this.bottomButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header,
        Expanded(child: content),
        if (bottomButton != null) bottomButton!
      ],
    );
  }

  Widget get _header => Column(
        children: [
          CustomLinearProgressIndicator(progress: progress),
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 0.8, color: Colors.grey))),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Stack(
              children: [
                if (onTapBack != null)
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: onTapBack,
                          child: const Icon(Icons.arrow_back_rounded))),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    title,
                    type: FontType.h5,
                    padding: const EdgeInsets.only(top: 2),
                  ),
                )
              ],
            ),
          )
        ],
      );
}
