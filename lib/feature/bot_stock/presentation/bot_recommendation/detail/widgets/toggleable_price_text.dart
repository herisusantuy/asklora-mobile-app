import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/utils/storage/shared_preference.dart';
import '../../../../bloc/toggleable_price_text_bloc.dart';

class ToggleablePriceText extends StatelessWidget {
  final double percentDifference;
  final double priceDifference;

  const ToggleablePriceText({
    Key? key,
    required this.percentDifference,
    required this.priceDifference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToggleablePriceTextBloc>(
      create: (_) =>
          ToggleablePriceTextBloc(sharedPreference: SharedPreference()),
      child: Builder(
        builder: (context) {
          String percentageText = (percentDifference == 0)
              ? '${percentDifference.abs().convertToCurrencyDecimal()}%'
              : (percentDifference < 0)
                  ? '${percentDifference.convertToCurrencyDecimal()}%'
                  : '+${percentDifference.convertToCurrencyDecimal()}%';
          String priceText = (priceDifference == 0)
              ? priceDifference.abs().convertToCurrencyDecimal()
              : (priceDifference < 0)
                  ? priceDifference.convertToCurrencyDecimal()
                  : '+${priceDifference.convertToCurrencyDecimal()}';

          final TextStyle toggleableTextStyle =
              AskLoraTextStyles.subtitle3.copyWith(color: AskLoraColors.white);
          final maxTextWidth = max(
            percentageText.textWidth(toggleableTextStyle),
            priceText.textWidth(toggleableTextStyle),
          );

          return GestureDetector(
            onTap: () {
              context
                  .read<ToggleablePriceTextBloc>()
                  .add(TogglePriceDifferenceEvent());
            },
            child: BlocBuilder<ToggleablePriceTextBloc, ToggleState>(
              buildWhen: (previous, current) =>
                  previous.showPriceDifference != current.showPriceDifference,
              builder: (context, state) {
                return Container(
                  width: maxTextWidth + 10,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (percentDifference < 0 || priceDifference < 0)
                        ? AskLoraColors.primaryMagenta
                        : AskLoraColors.primaryGreen,
                  ),
                  child: CustomTextNew(
                    state.showPriceDifference ? priceText : percentageText,
                    style: toggleableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
