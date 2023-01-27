import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import '../domain/chart_models.dart';
import '../utils/chart_util.dart';
import 'widgets/animated_icon_label.dart';
import 'widgets/animated_profit_label.dart';

class ChartAnimation extends StatefulWidget {
  final List<ChartDataSet> chartDataSets;

  const ChartAnimation({required this.chartDataSets, super.key});

  @override
  State<ChartAnimation> createState() => _ChartAnimationState();
}

class _ChartAnimationState extends State<ChartAnimation> {
  final TextStyle axisStyle = TextStyle(
    color: Colors.grey[700]!,
    fontWeight: FontWeight.bold,
    fontSize: 11,
  );

  final double chartHeight = 300;
  final int lineAnimationDuration = 250;
  final int pauseOnHedgeFoundDuration = 1000;

  final double _leftChartPadding = 6;
  final double _rightChartPadding = 12;

  final List<CoordinatesModel> flSpotsCoordinate = [];
  final List<FlSpot> flSpots = [];
  final List<int> showIndexes = [];
  final List<Widget> showCenterValue = [];

  final List<double> dashArray = [0, 1000];
  Timer? drawLineTimer;
  Timer? resumeTimer;
  late Timer drawLabelTimer;

  bool isLineAnimatedOnce = false;
  bool isLabelAnimatedOnce = false;
  bool isCurved = false;
  bool animationComplete = false;
  List<Widget> labels = [];
  int animateIndex = 0;
  double space = 0;
  double dash = 0;
  int linePathLength = 0;
  double addition = 0.08;

  @override
  void initState() {
    super.initState();
    drawLineChart();
  }

  @override
  void dispose() {
    if (drawLineTimer != null) {
      drawLineTimer!.cancel();
    }

    if (resumeTimer != null) {
      resumeTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: chartHeight,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                LineChart(
                  mainData(),
                ),
                ...labels
              ],
            ),
          ),
        ),
      ],
    );
  }

  void restartAnimation() {
    setState(() {
      animationComplete = false;
      drawLineTimer!.cancel();
      labels.clear();
      dashArray.clear();
      animateIndex = 0;
      dash = 0;
      space = linePathLength.toDouble();
      dashArray.addAll([dash, space]);
      animateLine();
    });
  }

  void resumeAnimationFromTempDashToDistance(factor, distance) {
    double tempDash = 0;
    resumeTimer = Timer.periodic(
        Duration(milliseconds: (factor / distance).round()), (timer) {
      if (mounted) {
        if (tempDash < distance) {
          dash = dash + addition;
          space = space - addition;

          setState(() {
            dashArray[0] = dash;
            dashArray[1] = space;
          });
        } else {
          animateIndex++;
          resumeTimer!.cancel();
          animateLine();
        }
        tempDash = tempDash + addition;
      }
    });
  }

  void animateLine() {
    int factor = (lineAnimationDuration / widget.chartDataSets.length).round();
    double currentDistance = 0;
    if (animateIndex < flSpotsCoordinate.length) {
      currentDistance = flSpotsCoordinate[animateIndex].distance;
    } else {
      setState(() {
        animationComplete = true;
        labels.add(AnimatedProfitLabel(
          hideProfit: false,
          key: UniqueKey(),
          additionalText: 'Overall Profit/Loss',
          delayDuration: Duration.zero,
          left: MediaQuery.of(context).size.width - 176,
          top: 0,
          profit: 0.9,
          hedgeType: HedgeType.sell,
        ));
      });
      return;
    }

    double tempDash = 0;

    drawLineTimer = Timer.periodic(
        Duration(milliseconds: ((factor / currentDistance)).round()), (timer) {
      if (mounted) {
        int? hedgeShare = widget.chartDataSets[animateIndex].hedgeShare;
        if (hedgeShare != null && hedgeShare != 0) {
          if (hedgeShare > 0) {
            setState(() {
              labels.add(AnimatedIconLabel(
                  key: UniqueKey(),
                  left: flSpotsCoordinate[animateIndex].offset.dx - 56,
                  top: flSpotsCoordinate[animateIndex].offset.dy + 10,
                  hedgeType: HedgeType.buy));
            });
          } else {
            setState(() {
              labels.add(AnimatedIconLabel(
                  key: UniqueKey(),
                  left: flSpotsCoordinate[animateIndex].offset.dx - 56,
                  top: flSpotsCoordinate[animateIndex].offset.dy - 58,
                  hedgeType: HedgeType.sell));
            });
          }
          labels.add(AnimatedProfitLabel(
            key: UniqueKey(),
            delayDuration: Duration.zero,
            left: flSpotsCoordinate[animateIndex].offset.dx >
                    (MediaQuery.of(context).size.width -
                        (_leftChartPadding + _rightChartPadding) -
                        120)
                ? (flSpotsCoordinate[animateIndex].offset.dx - 88)
                : (flSpotsCoordinate[animateIndex].offset.dx - 80),
            top: flSpotsCoordinate[animateIndex].offset.dy >
                    50 * (chartHeight - 24) / 100
                ? 10
                : (chartHeight - 120),
            profit: widget.chartDataSets[animateIndex].currentPnlRet!,
            hedgeType: hedgeShare > 0 ? HedgeType.buy : HedgeType.sell,
          ));

          drawLineTimer!.cancel();
          Future.delayed(Duration(milliseconds: pauseOnHedgeFoundDuration))
              .then((value) {
            resumeAnimationFromTempDashToDistance(factor, currentDistance);
          });
        } else if (tempDash < currentDistance) {
          dash = dash + addition;
          space = space - addition;

          setState(() {
            dashArray[0] = dash;
            dashArray[1] = space;
          });
        } else {
          animateIndex++;
          drawLineTimer!.cancel();
          if (dash < linePathLength) {
            animateLine();
          }
        }
        tempDash = tempDash + addition;
      }
    });
  }

  void drawLineChart() {
    for (var data in widget.chartDataSets) {
      flSpots.add(FlSpot(data.index!.toDouble(), data.price!));
      showIndexes.add(data.index!);
      showCenterValue.add(Text(
        'Profit : ${((data.currentPnlRet ?? 0) * 100).toStringAsFixed(2)}%',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
      ));
    }
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    ChartDataSet? chartDataSet = widget.chartDataSets
        .firstWhereOrNull((element) => element.index == value.round());
    if (chartDataSet != null) {
      return Transform.rotate(
          angle: math.pi / 8,
          child: Text(
            DateFormat('MM-dd').format(chartDataSet.date!),
            style: axisStyle,
          ));
    } else {
      return Container();
    }
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return Text(value.round().toString(),
        style: axisStyle, textAlign: TextAlign.left);
  }

  double get getMaxYValue {
    double maxValue = 0;
    for (var element in widget.chartDataSets) {
      if (element.price! > maxValue) {
        maxValue = element.price!;
      }
    }
    maxValue *= 1.1;
    maxValue = maxValue.round().toDouble();
    if (maxValue % 10 != 0) {
      maxValue += (10 - maxValue % 10);
    }
    return maxValue;
  }

  double get getMinYValue {
    double minValue = double.infinity;
    for (var element in widget.chartDataSets) {
      if (element.price! < minValue) {
        minValue = element.price!;
      }
    }
    double minFactor = minValue * 0.2;
    if ((minValue - minFactor) >= 0) {
      minValue -= minFactor;
    }
    return minValue;
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.transparent,
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: Colors.green,
                  strokeWidth: 1,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0XFFF5F5F5),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0XFFF5F5F5),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
              left: BorderSide(width: 1, color: Color(0XFFD2D2D2)),
              bottom: BorderSide(width: 1, color: Color(0XFFD2D2D2)))),
      minX: flSpots.first.x,
      maxX: widget.chartDataSets.length - 1,
      minY: getMinYValue,
      maxY: getMaxYValue,
      lineBarsData: [
        LineChartBarData(
          lineLengthCallback: (value) async {
            await Future.delayed(Duration.zero);
            if (!isLineAnimatedOnce) {
              linePathLength = value.round() + (isCurved ? 40 : 10);
              space = linePathLength.toDouble();
              dashArray.addAll([dash, space]);
              isLineAnimatedOnce = true;
              animateLine();
            }
          },
          drawingCoordinateCallback: (value) async {
            flSpotsCoordinate.clear();
            flSpotsCoordinate.addAll(value);
            await Future.delayed(Duration.zero);
            if (!isLabelAnimatedOnce) {
              isLabelAnimatedOnce = true;
            }
          },
          dashArray: dashArray,
          showingIndicators: showIndexes,
          showingTopRightValue: showCenterValue,
          spots: flSpots,
          isCurved: isCurved,
          color: Colors.black,
          barWidth: 3.2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
