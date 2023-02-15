import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';

class CustomDonutChart extends StatelessWidget {
  final int total;
  final List<PieChartSectionData>? sections;
  const CustomDonutChart({
    Key? key,
    this.total = 0,
    this.sections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 8,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              startDegreeOffset: -90,
              sections: sections,
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: AskLoraColors.black,
                  strokeAlign: 20,
                  width: 2,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: CustomTextNew(
                '$total %',
                style: AskLoraTextStyles.subtitle2,
              )),
        ],
      ),
    );
  }
}
