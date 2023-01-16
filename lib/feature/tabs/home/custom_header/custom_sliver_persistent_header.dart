import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import 'custom_shape.dart';

class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return OverflowBox(
        maxHeight: constraints.biggest.height + 100,
        alignment: Alignment.topCenter,
        child: SizedBox.fromSize(
          size: constraints.biggest + Offset(0, max(0, 100 - shrinkOffset)),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(shape: CustomShape(shrinkOffset)),
            child: Container(
              color: AskLoraColors.charcoal,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        getSvgIcon('icon_notification'),
                        const SizedBox(width: 15),
                        getSvgIcon('icon_settings'),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: CustomTextNew(
                          'You are making great\nprogress, Sassy Chris!',
                          style: AskLoraTextStyles.h3.copyWith(
                            color: AskLoraColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  double get maxExtent => 120.0;

  @override
  double get minExtent => 55.0;
}
