import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/we_create/custom_linear_progress_indicator.dart';
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
        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Expanded(
        //           child: Padding(
        //         padding: AppValues.screenHorizontalPadding,
        //         child: content,
        //       )),
        //       if (bottomButton != null)
        //         Padding(
        //           padding: AppValues.screenHorizontalPadding,
        //           child: bottomButton!,
        //         )
        //     ],
        //   ),
        // ),
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
