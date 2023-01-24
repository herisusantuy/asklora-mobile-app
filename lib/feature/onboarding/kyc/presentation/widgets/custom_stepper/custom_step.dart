part of 'custom_stepper.dart';

class CustomStep extends StatelessWidget {
  final String svgAssetName;
  final bool drawLine;
  final String? label;
  final double height;
  final Widget? widgetStep;

  const CustomStep(
      {this.svgAssetName = 'inactive_step_icon',
      this.drawLine = false,
      this.label,
      this.height = 54,
      this.widgetStep,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            getSvgIcon(svgAssetName, height: 18, width: 18),
            if (drawLine)
              CustomPaint(
                  painter: DashedLineVerticalPainter(),
                  size: Size(1, height - 20)),
          ],
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: SizedBox(
            height: height,
            child: widgetStep ??
                CustomTextNew(
                  label ?? '',
                  style: AskLoraTextStyles.body1
                      .copyWith(color: AskLoraColors.charcoal),
                ),
          ),
        ),
      ],
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 2, dashSpace = 2, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
