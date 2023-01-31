import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';

class BalanceBaseWidget extends StatelessWidget {
  final Widget content;
  final Widget bottomButton;
  final bool useHeader;
  final String title;

  const BalanceBaseWidget(
      {required this.content,
      this.useHeader = true,
      required this.bottomButton,
         this.title='',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        enableBackNavigation: useHeader,
        body: Column(
          children: [
            if (useHeader)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: CustomTextNew(
                    title,
                    style: AskLoraTextStyles.h5
                        .copyWith(color: AskLoraColors.charcoal),
                  ),
                ),
              ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: AppValues.screenHorizontalPadding,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: content,
                        ),
                        bottomButton
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ));
  }
}
