import 'package:flutter/material.dart';

import '../../../../core/styles/asklora_colors.dart';

class CustomBaseSilverBox extends StatelessWidget {
  final Widget child;
  const CustomBaseSilverBox({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
            color: AskLoraColors.whiteSmoke,
            borderRadius: BorderRadius.circular(20)),
        child: child,
      );
}
