part of 'custom_stepper.dart';

class CustomStep extends StatelessWidget {
  final String svgAsset;
  final bool drawLine;
  final String label;

  const CustomStep(
      {this.svgAsset = 'inactive_step_icon.svg',
        this.drawLine = false,
        required this.label,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            if (drawLine)
              CustomPaint(
                  painter: DashedLineVerticalPainter(),
                  size: const Size(1, 30)),
            SvgPicture.asset('assets/icons/kyc/$svgAsset'),
          ],
        ),
        CustomText(label, type: FontType.smallText, padding: const EdgeInsets.only(left: 12, bottom: 2),)
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