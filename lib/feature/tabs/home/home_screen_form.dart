import 'package:flutter/material.dart';

import '../../../core/presentation/radar_chart.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import 'custom_header/custom_sliver_persistent_header.dart';
import 'widgets/onboarding_status.dart';

class HomeScreenForm extends StatelessWidget {
  const HomeScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    var ticks = [7, 14, 21, 28, 35];
    var features = ['Risk Tolerance', 'Patient', 'Detailed'];
    var data = [
      [10.0, 20, 28]
    ];
    double numberOfFeatures = 3;

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverPersistentHeader(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 100),
                OnboardingStatus(
                    title: 'START INVESTING',
                    subTitle: 'Create an account',
                    onTap: () {},
                    progress: 0.2),
                Container(
                  height: 300,
                  width: 300,
                  child: RadarChart(
                    backgroundColor: AskLoraColors.whiteSmoke,
                    ticks: ticks,
                    features: features,
                    data: data,
                    featuresTextStyle: AskLoraTextStyles.subtitle2
                        .copyWith(color: AskLoraColors.charcoal),
                    axisColor: AskLoraColors.gray,
                    outlineColor: AskLoraColors.primaryGreen,
                    graphColors: [AskLoraColors.primaryGreen],
                  ),
                ),
                /*Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        height: 10,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.7,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff00ff00)),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      ),
                    ),
                    // CustomLinearProgressIndicator(progress: 0),
                    // CustomLinearProgressIndicator(progress: 0),
                  ],
                ),*/
                Container(color: Colors.red, height: 800),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
