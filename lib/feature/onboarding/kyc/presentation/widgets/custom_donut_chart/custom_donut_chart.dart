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
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (total == 0)
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(65),
              ),
            ),
          if (total == 0)
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
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
          CustomTextNew(
            '$total %',
            style: AskLoraTextStyles.subtitle2,
          ),
        ],
      ),
    );
  }
}
