import 'dart:math' as math;
import 'dart:math' show cos, pi, pow, sin, sqrt;

import 'package:flutter/material.dart';

const defaultGraphColors = [
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.orange,
];

class RadarChart extends StatefulWidget {
  final List<int> ticks;
  final List<String> features;
  final List<List<num>> data;
  final bool reverseAxis;
  final TextStyle ticksTextStyle;
  final TextStyle featuresTextStyle;
  final Color outlineColor;
  final Color backgroundColor;
  final Color axisColor;
  final List<Color> graphColors;
  final int sides;

  const RadarChart({
    Key? key,
    required this.ticks,
    required this.features,
    required this.data,
    this.reverseAxis = false,
    this.ticksTextStyle = const TextStyle(color: Colors.grey, fontSize: 12),
    this.featuresTextStyle = const TextStyle(color: Colors.black, fontSize: 16),
    this.outlineColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.axisColor = Colors.grey,
    this.graphColors = defaultGraphColors,
    this.sides = 0,
  }) : super(key: key);

  factory RadarChart.light({
    required List<int> ticks,
    required List<String> features,
    required List<List<num>> data,
    bool reverseAxis = false,
    bool useSides = false,
  }) {
    return RadarChart(
        ticks: ticks,
        features: features,
        data: data,
        reverseAxis: reverseAxis,
        sides: useSides ? features.length : 0);
  }

  factory RadarChart.dark({
    required List<int> ticks,
    required List<String> features,
    required List<List<num>> data,
    bool reverseAxis = false,
    bool useSides = false,
  }) {
    return RadarChart(
        ticks: ticks,
        features: features,
        data: data,
        featuresTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        outlineColor: Colors.white,
        axisColor: Colors.grey,
        reverseAxis: reverseAxis,
        sides: useSides ? features.length : 0);
  }

  @override
  _RadarChartState createState() => _RadarChartState();
}

class _RadarChartState extends State<RadarChart>
    with SingleTickerProviderStateMixin {
  double fraction = 0;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: animationController,
    ))
      ..addListener(() {
        setState(() {
          fraction = animation.value;
        });
      });

    animationController.forward();
  }

  @override
  void didUpdateWidget(RadarChart oldWidget) {
    super.didUpdateWidget(oldWidget);

    animationController.reset();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: RadarChartPainter(
          widget.ticks,
          widget.features,
          widget.data,
          widget.reverseAxis,
          widget.ticksTextStyle,
          widget.featuresTextStyle,
          widget.outlineColor,
          widget.backgroundColor,
          widget.axisColor,
          widget.graphColors,
          widget.sides,
          fraction),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class RadarChartPainter extends CustomPainter {
  final List<int> ticks;
  final List<String> features;
  final List<List<num>> data;
  final bool reverseAxis;
  final TextStyle ticksTextStyle;
  final TextStyle featuresTextStyle;
  final Color outlineColor;
  final Color backgroundColor;
  final Color axisColor;
  final List<Color> graphColors;
  final int sides;
  final double fraction;

  RadarChartPainter(
    this.ticks,
    this.features,
    this.data,
    this.reverseAxis,
    this.ticksTextStyle,
    this.featuresTextStyle,
    this.outlineColor,
    this.backgroundColor,
    this.axisColor,
    this.graphColors,
    this.sides,
    this.fraction,
  );

  Path variablePath(Size size, double radius, int sides) {
    var path = Path();
    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);

    if (sides < 3) {
      // Draw a circle
      path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: radius,
      ));
    } else {
      // Draw a polygon
      Offset startPoint = Offset(radius * cos(-pi / 2), radius * sin(-pi / 2));

      path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

      for (int i = 1; i <= sides; i++) {
        double x = radius * cos(angle * i - pi / 2) + center.dx;
        double y = radius * sin(angle * i - pi / 2) + center.dy;
        path.lineTo(x, y);
      }
      path.close();
    }
    return path;
  }

  void _drawDashedLine(double dashLength, double dashSpace, Offset firstOffset,
      Offset secondOffset, Canvas canvas, Size size, Paint paint) {
    var startOffset = firstOffset;

    var intervals = (_getDirectionVector(firstOffset, secondOffset).length /
            (dashLength + dashSpace))
        .round();

    for (var i = 0; i < intervals; i++) {
      var endOffset = _getNextOffset(startOffset, secondOffset, dashLength);

      /// Draw a small line.
      canvas.drawLine(startOffset, endOffset, paint);

      /// Update the starting offset.
      startOffset = _getNextOffset(endOffset, secondOffset, dashSpace);
    }
  }

  Offset _getNextOffset(
    Offset firstOffset,
    Offset secondOffset,
    double smallVectorLength,
  ) {
    var directionVector = _getDirectionVector(firstOffset, secondOffset);

    var rescaleFactor = smallVectorLength / directionVector.length;
    if (rescaleFactor.isNaN || rescaleFactor.isInfinite) {
      rescaleFactor = 1;
    }

    var rescaledVector = Offset(directionVector.vector.dx * rescaleFactor,
        directionVector.vector.dy * rescaleFactor);

    var newOffset = Offset(
        firstOffset.dx + rescaledVector.dx, firstOffset.dy + rescaledVector.dy);

    return newOffset;
  }

  DirectionVector _getDirectionVector(Offset firstVector, Offset secondVector) {
    var directionVector = Offset(
        secondVector.dx - firstVector.dx, secondVector.dy - firstVector.dy);

    var directionVectorLength =
        sqrt(pow(directionVector.dx, 2) + pow(directionVector.dy, 2));

    return DirectionVector(
      vector: directionVector,
      length: directionVectorLength,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2.0;
    final centerY = size.height / 2.0;
    final centerOffset = Offset(centerX, centerY);
    final radius = math.min(centerX, centerY) * 0.8;
    final scale = radius / ticks.last;

    // Painting the chart outline
    var outlinePaint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..isAntiAlias = true;

    var backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    var ticksPaint = Paint()
      ..color = axisColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    canvas.drawPath(variablePath(size, radius, sides), outlinePaint);

    canvas.drawPath(variablePath(size, radius, sides), backgroundPaint);
    // Painting the circles and labels for the given ticks (could be auto-generated)
    // The last tick is ignored, since it overlaps with the feature label
    //var tickDistance = radius / (ticks.length);
    var tickLabels = reverseAxis ? ticks.reversed.toList() : ticks;

    if (reverseAxis) {
      TextPainter(
        text: TextSpan(text: tickLabels[0].toString(), style: ticksTextStyle),
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: 0, maxWidth: size.width)
        ..paint(canvas, Offset(centerX, centerY - ticksTextStyle.fontSize!));
    }

    tickLabels
        .sublist(
            reverseAxis ? 1 : 0, reverseAxis ? ticks.length : ticks.length - 1)
        .asMap()
        .forEach((index, tick) {
      //var tickRadius = tickDistance * (index + 1);

      //canvas.drawPath(variablePath(size, tickRadius, this.sides), ticksPaint);

      // TextPainter(
      //   text: TextSpan(text: tick.toString(), style: ticksTextStyle),
      //   textDirection: TextDirection.ltr,
      // )
      //   ..layout(minWidth: 0, maxWidth: size.width)
      //   ..paint(canvas,
      //       Offset(centerX, centerY - tickRadius - ticksTextStyle.fontSize!));
    });

    // Painting the axis for each given feature
    var angle = (2 * pi) / features.length;

    features.asMap().forEach((index, feature) {
      var xAngle = cos(angle * index - pi / 2);
      var yAngle = sin(angle * index - pi / 2);

      var featureOffset =
          Offset(centerX + radius * xAngle, centerY + radius * yAngle);

      //canvas.drawLine(centerOffset, featureOffset, ticksPaint);
      //paint dashed line ticks
      _drawDashedLine(
          3, 3, centerOffset, featureOffset, canvas, size, ticksPaint);

      var featureLabelFontHeight = featuresTextStyle.fontSize;
      var labelYOffset = yAngle < 0 ? -featureLabelFontHeight! : 0;
      var labelXOffset = xAngle > 0 ? featureOffset.dx : 0.0;

      TextPainter(
        text: TextSpan(text: feature, style: featuresTextStyle),
        textAlign: xAngle < 0 ? TextAlign.right : TextAlign.left,
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: featureOffset.dx)
        ..paint(canvas, Offset(labelXOffset, featureOffset.dy + labelYOffset));
    });

    // Painting each graph
    data.asMap().forEach((index, graph) {
      var graphPaint = Paint()
        ..color = graphColors[index % graphColors.length].withOpacity(0.3)
        ..style = PaintingStyle.stroke;

      var graphOutlinePaint = Paint()
        ..color = graphColors[index % graphColors.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..isAntiAlias = true;

      // Start the graph on the initial point
      var scaledPoint = scale * graph[0] * fraction;
      var path = Path();

      if (reverseAxis) {
        path.moveTo(centerX, centerY - (radius * fraction - scaledPoint));
      } else {
        path.moveTo(centerX, centerY - scaledPoint);
      }

      var pointerPaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      List<Offset> circleOffset = [];
      graph.asMap().forEach((index, point) {
        //if (index == 0) return;

        var xAngle = cos(angle * index - pi / 2);
        var yAngle = sin(angle * index - pi / 2);
        var scaledPoint = scale * point * fraction;

        if (reverseAxis) {
          path.lineTo(centerX + (radius * fraction - scaledPoint) * xAngle,
              centerY + (radius * fraction - scaledPoint) * yAngle);
        } else {
          path.lineTo(
              centerX + scaledPoint * xAngle, centerY + scaledPoint * yAngle);
        }
        circleOffset.add(Offset(
            centerX + scaledPoint * xAngle, centerY + scaledPoint * yAngle));
      });

      path.close();
      canvas.drawPath(path, graphPaint);
      canvas.drawPath(path, graphOutlinePaint);
      for (var element in circleOffset) {
        canvas.drawCircle(element, 6, pointerPaint);
      }
    });
  }

  @override
  bool shouldRepaint(RadarChartPainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}

class DirectionVector {
  final Offset vector;
  final double length;

  const DirectionVector({
    required this.vector,
    required this.length,
  });
}
