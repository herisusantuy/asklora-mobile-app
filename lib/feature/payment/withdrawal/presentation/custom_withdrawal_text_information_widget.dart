import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';

class CustomWithdrawalTextInformationWidget extends StatelessWidget {
  final String title;
  final String label;
  final double paddingBottom;

  const CustomWithdrawalTextInformationWidget(
      {required this.title,
      required this.label,
      this.paddingBottom = 20,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            type: FontType.smallTextBold,
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: CustomText(
                label,
                type: FontType.bodyText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
