import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class OrderBottomSheetWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsets padding;

  const OrderBottomSheetWidget(
      {required this.title,
      required this.children,
      this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      Key key = const Key('order_bottom_sheet_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: padding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            size: 32,
                          ))),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      title,
                      type: FontType.h5,
                      padding: const EdgeInsets.only(bottom: 12, top: 4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ...children
            ],
          ),
        ),
      ),
    );
  }
}
