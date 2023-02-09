import 'package:flutter/material.dart';

import '../values/app_values.dart';

class CustomStretchedLayout extends StatelessWidget {
  final Widget? header;
  final Widget content;
  final Widget? bottomButton;
  final EdgeInsets contentPadding;

  const CustomStretchedLayout(
      {Key? key,
      this.header,
      required this.content,
      this.bottomButton,
      this.contentPadding = AppValues.screenHorizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (header != null) header!,
        Expanded(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: contentPadding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0, bottom: 43),
                          child: content,
                        ),
                        if (bottomButton != null) bottomButton!
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
