import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';

Future modalUploadDocument(
        {required BuildContext context,
        String title = '',
        String buttonText = 'Browse',
        required Function() onClick}) =>
    showModalBottomSheet(
        context: context,
        builder: (_) => SafeArea(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    title,
                    padding: const EdgeInsets.only(bottom: 20),
                  ),
                  CustomTextButton(
                      borderRadius: 30,
                      buttonText: buttonText,
                      onClick: () => onClick),
                ],
              ),
            )));
