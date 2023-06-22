import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../styles/asklora_colors.dart';
import 'tutorial_touch_guide.dart';

class CustomShowcaseView extends StatelessWidget {
  final GlobalKey globalKey;
  final Widget child;
  final Widget tooltipWidget;
  final VoidCallback? onToolTipClick;
  final TooltipPosition tooltipPosition;
  const CustomShowcaseView({
    Key? key,
    required this.globalKey,
    required this.tooltipWidget,
    required this.child,
    this.onToolTipClick,
    this.tooltipPosition = TooltipPosition.bottom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      disableDefaultTargetGestures: true,
      disableMovingAnimation: true,
      tooltipPosition: tooltipPosition,
      key: globalKey,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      targetPadding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 0,
      targetBorderRadius: BorderRadius.circular(20),
      container: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              margin: tooltipPosition == TooltipPosition.top
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width - 30,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: AskLoraColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: tooltipWidget),
          const SizedBox(height: 10),
          GestureDetector(
              onTap: onToolTipClick, child: const TutorialTouchGuide()),
        ],
      ),
      child: child,
    );
  }
}
