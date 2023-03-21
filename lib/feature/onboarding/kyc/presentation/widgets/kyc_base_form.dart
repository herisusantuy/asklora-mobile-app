import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_header.dart';
import '../../../../../core/presentation/custom_stretched_layout.dart';
import '../../../../../core/presentation/we_create/custom_linear_progress_indicator.dart';
import '../../../../../core/styles/asklora_colors.dart';

class KycBaseForm extends StatelessWidget {
  final String title;
  final Widget content;
  final Function()? onTapBack;
  final Widget? bottomButton;
  final Widget? headerContent;
  final double progress;

  const KycBaseForm(
      {required this.title,
      required this.content,
      required this.progress,
      this.onTapBack,
      this.bottomButton,
      this.headerContent,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStretchedLayout(
      header: _header,
      content: content,
      bottomButton: bottomButton,
    );
  }

  Widget get _header => Column(
        children: [
          CustomLinearProgressIndicator(
            progress: progress,
            padding:
                const EdgeInsets.only(left: 10, top: 10, bottom: 5, right: 2),
          ),
          CustomHeader(
            title: title,
            onTapBack: onTapBack,
          ),
          if (headerContent != null)
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: AskLoraColors.gray,
                width: 2,
              ))),
              child: headerContent!,
            )
        ],
      );
}
