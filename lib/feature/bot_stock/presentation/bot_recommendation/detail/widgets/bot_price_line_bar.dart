import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';

class BotPriceLineBar extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final double currentPrice;
  final double labelTopPadding = 18;
  final Size dotSize = const Size(10, 10);

  const BotPriceLineBar(
      {required this.minPrice,
      required this.maxPrice,
      required this.currentPrice,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        double edgeMinPrice = currentPrice - 50;
        double widthConstraint = constraints.maxWidth;
        double translationMinPrice =
            ((minPrice - edgeMinPrice) / 100) * widthConstraint;
        double translationMaxPrice =
            (((maxPrice - edgeMinPrice) / 100) * widthConstraint -
                translationMinPrice);
        double translationCurrentPrice =
            ((currentPrice - edgeMinPrice) / 100) * widthConstraint;
        return SizedBox(
            height: 40,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  height: 1,
                  width: double.infinity,
                  color: AskLoraColors.lightGray,
                ),
                Positioned(
                    left: translationMinPrice,
                    child: Container(
                      margin: const EdgeInsets.only(top: 3),
                      height: 3,
                      width: translationMaxPrice,
                      decoration: BoxDecoration(
                          color: AskLoraColors.primaryMagenta,
                          borderRadius: BorderRadius.circular(100),
                          border:
                              Border.all(color: AskLoraColors.primaryMagenta)),
                    )),
                Positioned(
                    top: labelTopPadding,
                    left: translationMinPrice -
                        _textSize(maxPrice.toStringAsFixed(1),
                                    AskLoraTextStyles.body4)
                                .width /
                            2,
                    child: CustomTextNew(
                      minPrice.toStringAsFixed(2),
                      style: AskLoraTextStyles.body4,
                    )),
                Positioned(
                    top: labelTopPadding,
                    left: translationMinPrice +
                        translationMaxPrice -
                        _textSize(maxPrice.toStringAsFixed(1),
                                    AskLoraTextStyles.body4)
                                .width /
                            2,
                    child: CustomTextNew(
                      maxPrice.toStringAsFixed(2),
                      style: AskLoraTextStyles.body4,
                    )),
                Positioned(
                    left: translationCurrentPrice,
                    child: Container(
                      height: dotSize.height,
                      width: dotSize.width,
                      decoration: const BoxDecoration(
                          color: AskLoraColors.primaryMagenta,
                          shape: BoxShape.circle),
                    )),
                Positioned(
                    top: labelTopPadding,
                    left: translationCurrentPrice -
                        _textSize(currentPrice.toStringAsFixed(1),
                                    AskLoraTextStyles.body4)
                                .width /
                            2 +
                        dotSize.width / 2,
                    child: CustomTextNew(
                      currentPrice.toStringAsFixed(2),
                      style: AskLoraTextStyles.body4,
                    ))
              ],
            ));
      });

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
