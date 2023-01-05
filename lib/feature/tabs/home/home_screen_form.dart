import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/radar_chart.dart';
import '../../../core/styles/asklora_text_styles.dart';
import 'custom_header/custom_sliver_persistent_header.dart';

class HomeScreenForm extends StatelessWidget {
  const HomeScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    var ticks = [7, 14, 21, 28, 35];
    var features = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"];
    var data = [
      [10.0, 20, 28, 5, 16, 15, 17, 6],
      [14.5, 1, 4, 14, 23, 10, 6, 19]
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
                CustomTextNew(
                  'START INVESTING',
                  style: AskLoraTextStyles.h4Italic,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 10,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                      backgroundColor: Color(0xffD6D6D6),
                    ),
                  ),
                ),
                Container(
                  height: 300, width: 300,
                  child:
                      RadarChart(ticks: ticks, features: features, data: data),
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
