import 'package:flutter/material.dart';

import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';

class BotBottomSheetWidget extends StatelessWidget {
  const BotBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 0),
      children: [
        Stack(
          children: [
            Container(
              padding: AppValues.screenHorizontalPadding.copyWith(top: 64),
              margin: const EdgeInsets.only(top: 70),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(43),
                    topRight: Radius.circular(43)),
              ),
              child: Column(
                children: [
                  CustomTextNew(
                    'Your free Botstock has been added to your portfolio successfully!',
                    style: AskLoraTextStyles.h4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ButtonPair(
                      primaryButtonOnClick: () {},
                      secondaryButtonOnClick: () => Navigator.pop(context),
                      primaryButtonLabel: 'DEPOSIT TO START REAL TRADE',
                      secondaryButtonLabel: 'NOT NOW')
                ],
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: LoraMemojiWidget(loraMemojiType: LoraMemojiType.lora1),
            ),
          ],
        ),
      ],
    );
  }
}
