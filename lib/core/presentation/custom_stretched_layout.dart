import 'package:flutter/material.dart';

import '../../feature/tabs/utils/tab_utils.dart';
import '../values/app_values.dart';

class CustomStretchedLayout extends StatelessWidget {
  final Widget? header;
  final Widget content;
  final Widget? bottomButton;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final bool isUsedWithBottomTab;

  const CustomStretchedLayout(
      {Key? key,
      this.header,
      required this.content,
      this.bottomButton,
      this.padding = AppValues.screenHorizontalPadding,
      this.isUsedWithBottomTab = false,
      this.contentPadding = const EdgeInsets.only(top: 24.0, bottom: 43)})
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
                padding: EdgeInsets.only(
                    bottom: isUsedWithBottomTab ? tabHeight : 0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: padding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: contentPadding,
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
