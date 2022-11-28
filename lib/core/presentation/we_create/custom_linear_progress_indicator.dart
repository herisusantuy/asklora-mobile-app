import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double progress;
  final EdgeInsets padding;

  const CustomLinearProgressIndicator(
      {required this.progress, this.padding = EdgeInsets.zero, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[350],
        value: progress,
        color: Colors.grey[700],
      ),
    );
  }
}
