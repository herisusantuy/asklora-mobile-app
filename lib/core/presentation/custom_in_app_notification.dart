import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import 'custom_text_new.dart';
import 'loading/overlay_controller_widget_extension.dart';

class CustomInAppNotification extends StatefulWidget {
  const CustomInAppNotification({super.key, this.message = ''});

  final String message;

  @override
  State<StatefulWidget> createState() => _CustomInAppNotificationState();
}

class _CustomInAppNotificationState extends State<CustomInAppNotification>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    position = Tween<Offset>(begin: const Offset(0.0, -4.0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut));

    controller.forward();

    timer = Timer(const Duration(seconds: 3), () {
      controller.reverse();
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        context.loaderOverlay
            .visibleInAppNotification(inAppNotification: false);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 75.0, left: 20, right: 20),
          child: SlideTransition(
            position: position,
            child: Container(
              decoration: ShapeDecoration(
                  color: AskLoraColors.primaryMagenta,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CustomTextNew(
                          widget.message,
                          style: AskLoraTextStyles.body1
                              .copyWith(color: AskLoraColors.white),
                        )),
                        GestureDetector(
                            onTap: () {
                              controller.reverse();
                              timer.cancel();
                            },
                            child: SvgPicture.asset(
                                'assets/icons/icon_in_app_notification_close.svg')),
                      ])),
            ),
          ),
        ));
  }
}
