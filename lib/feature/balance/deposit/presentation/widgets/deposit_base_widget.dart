import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';

class DepositBaseWidget extends StatelessWidget {
  final Widget content;
  final Widget bottomButton;

  const DepositBaseWidget(
      {required this.content, required this.bottomButton, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: CustomTextNew(
              'Deposit',
              style:
                  AskLoraTextStyles.h5.copyWith(color: AskLoraColors.charcoal),
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
