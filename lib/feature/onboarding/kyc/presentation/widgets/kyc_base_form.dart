import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/we_create/custom_linear_progress_indicator.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';

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
        Expanded(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: AppValues.screenHorizontalPadding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0, bottom: 43),
                          child: content,
                        ),
                        if (bottomButton != null) bottomButton!
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget get _header => Column(
        children: [
          CustomLinearProgressIndicator(progress: progress),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Stack(
              children: [
                if (onTapBack != null)
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: onTapBack,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 24,
                          ))),
                Align(
                  alignment: Alignment.center,
                  child: CustomTextNew(
                    title,
                    style: AskLoraTextStyles.h5,
                  ),
                )
              ],
            ),
          )
        ],
      );
}
