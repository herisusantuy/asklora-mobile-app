import 'package:flutter/material.dart';

import '../../../../../core/values/app_values.dart';

class GiftBotStockBaseWidget extends StatelessWidget {
  final Widget content;
  final Widget bottomButton;
  final EdgeInsets padding;

  const GiftBotStockBaseWidget(
      {Key? key,
      required this.content,
      required this.bottomButton,
      this.padding = AppValues.screenHorizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LayoutBuilder(builder: (context, viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [content, bottomButton],
            ),
          ),
        );
      }),
    );
  }
}
