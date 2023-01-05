import 'package:flutter/material.dart';
import '../../../../core/styles/asklora_colors.dart';

class LoraPopUpMessage extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;

  const LoraPopUpMessage(
      {required this.children,
      this.backgroundColor = AskLoraColors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 64, bottom: 32),
                margin: const EdgeInsets.only(top: 70),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: children,
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/memoji.png')),
          ],
        ),
      ),
    );
  }
}
