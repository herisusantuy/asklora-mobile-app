import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_scaffold.dart';

class AiLayoutWithBackground extends StatelessWidget {
  final Widget content;

  const AiLayoutWithBackground({required this.content, super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('assets/lora_gpt_background.png'),
              fit: BoxFit.cover),
        ),
        child: CustomScaffold(
          enableBackNavigation: false,
          appBarBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          body: content,
        ),
      );
}
