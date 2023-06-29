import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../styles/asklora_colors.dart';
import 'tutorial_touch_guide.dart';

enum PointerPosition {
  top,
  bottom,
}

class CustomShowcaseView extends StatelessWidget {
  final GlobalKey tutorialKey;
  final Widget child;
  final Widget tooltipWidget;
  final VoidCallback? onToolTipClick;
  final TooltipPosition tooltipPosition;
  final BorderRadius targetBorderRadius;
  final EdgeInsets targetPadding;
  final double overlayOpacity;
  final Color overlayColor;
  final PointerPosition pointerPosition;
  const CustomShowcaseView({
    Key? key,
    required this.tutorialKey,
    required this.child,
    required this.tooltipWidget,
    this.onToolTipClick,
    this.tooltipPosition = TooltipPosition.bottom,
    this.targetPadding = const EdgeInsets.all(10),
    this.targetBorderRadius = const BorderRadius.all(Radius.circular(20)),
    this.overlayColor = Colors.black,
    this.overlayOpacity = 0.5,
    this.pointerPosition = PointerPosition.bottom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      onTargetClick: () {},
      disableMovingAnimation: true,
      tooltipPosition: tooltipPosition,
      key: tutorialKey,
      overlayColor: overlayColor,
      overlayOpacity: overlayOpacity,
      targetPadding: targetPadding,
      width: MediaQuery.of(context)
          .size
          .width, //* container width for tooltip widget
      height: 0,
      targetBorderRadius: targetBorderRadius,
      container: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (pointerPosition == PointerPosition.top)
            Column(
              children: [
                GestureDetector(
                    onTap: onToolTipClick, child: const TutorialTouchGuide()),
                const SizedBox(height: 10),
              ],
            ),
          Container(
              margin: tooltipPosition == TooltipPosition.top
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width -
                  30, //* width of tooltip widget
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: AskLoraColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: tooltipWidget),
          if (pointerPosition == PointerPosition.bottom)
            Column(
              children: [
                const SizedBox(height: 10),
                GestureDetector(
                    onTap: onToolTipClick, child: const TutorialTouchGuide()),
              ],
            )
        ],
      ),
      child: child,
    );
  }
}
