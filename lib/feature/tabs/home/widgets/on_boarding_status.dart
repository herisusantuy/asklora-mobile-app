import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';

class OnBoardingStatus extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color valueColor;
  final Color backgroundColor;
  final double edgeRadius;
  final int intersectCount;
  final double progress;
  final int arrowPointingOnSection;
  final VoidCallback onTap;

  const OnBoardingStatus(
      {required this.title,
      required this.subTitle,
      required this.onTap,
      this.valueColor = AskLoraColors.primaryMagenta,
      this.backgroundColor = AskLoraColors.charcoal,
      this.arrowPointingOnSection = 1,
      this.edgeRadius = 10,
      this.intersectCount = 2,
      required this.progress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextNew(
                title,
                style: AskLoraTextStyles.h4Italic,
              ),
            ),
            CustomTextNew(
              'The Button',
              style: AskLoraTextStyles.body1,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(edgeRadius)),
              child: LinearProgressIndicator(
                minHeight: 10,
                value: progress,
                valueColor: AlwaysStoppedAnimation<Color>(valueColor),
                backgroundColor: backgroundColor,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: getIntersectContainer),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        OnBoardingStatusButton(
          arrowPointingOnSection: arrowPointingOnSection,
          onTap: onTap,
          intersectCount: intersectCount,
          subTitle: subTitle,
        ),
      ],
    );
  }

  List<Widget> get getIntersectContainer {
    List<Widget> children = [];
    for (int i = 0; i < intersectCount; i++) {
      children.add(
        Container(
          height: 10,
          width: 4,
          color: Colors.white,
        ),
      );
    }
    return children;
  }
}

class OnBoardingStatusButton extends StatefulWidget {
  final VoidCallback onTap;
  final int arrowPointingOnSection;
  final int intersectCount;
  final String subTitle;

  const OnBoardingStatusButton(
      {required this.arrowPointingOnSection,
      required this.onTap,
      required this.intersectCount,
      required this.subTitle,
      Key? key})
      : super(key: key);

  @override
  State<OnBoardingStatusButton> createState() => _OnBoardingStatusButtonState();
}

class _OnBoardingStatusButtonState extends State<OnBoardingStatusButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const triangleWidth = 20;
      return GestureDetector(
        onTapDown: (_) => setState(() {
          _isPressed = true;
        }),
        onTapUp: (_) => setState(() {
          _isPressed = false;
        }),
        onTapCancel: () => setState(() {
          _isPressed = false;
        }),
        onTap: widget.onTap,
        child: Stack(
          children: [
            Positioned(
              left: (constraints.maxWidth *
                      (1 + (widget.arrowPointingOnSection - 1) * 2) /
                      ((widget.intersectCount + 1) * 2) -
                  triangleWidth / 2),
              child: ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: _isPressed
                      ? AskLoraColors.darkGray
                      : AskLoraColors.charcoal,
                  height: 10,
                  width: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 9),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(43),
                  color: _isPressed
                      ? AskLoraColors.darkGray
                      : AskLoraColors.charcoal),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextNew(
                          'NEXT STEP',
                          style: AskLoraTextStyles.subtitleAllCap1.copyWith(
                              color: AskLoraColors.white, letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextNew(
                          widget.subTitle,
                          style: AskLoraTextStyles.h6
                              .copyWith(color: AskLoraColors.white),
                        ),
                      ],
                    ),
                  ),
                  CustomTextNew(
                    'GO',
                    style: AskLoraTextStyles.button2
                        .copyWith(color: AskLoraColors.primaryGreen),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AskLoraColors.primaryGreen,
                    size: 10,
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
