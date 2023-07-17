import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/values/app_values.dart';

class AiLayoutWithBackground extends StatelessWidget {
  final Widget content;

  const AiLayoutWithBackground({required this.content, super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: AppValues.loraBackgroundBoxDecoration,
        child: CustomScaffold(
          appBarBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          body: content,
        ),
      );
}
