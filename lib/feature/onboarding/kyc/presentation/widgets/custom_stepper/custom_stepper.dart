import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/presentation/custom_text.dart';

part 'custom_step.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const CustomStepper({this.currentStep = 0, required this.steps, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    children: steps
        .asMap()
        .entries
        .map((element) => CustomStep(
      svgAsset: _getSvgAsset(element.key, currentStep),
      label: element.value,
      drawLine: element.key!=0,
    ))
        .toList(),
  );

  String _getSvgAsset(int index, int currentStep){
    if(index+1 < currentStep){
      return 'passed_step_icon.svg';
    }
    else if(index+1==currentStep){
      return 'active_step_icon.svg';
    }
    else{
      return 'inactive_step_icon.svg';
    }
  }
}