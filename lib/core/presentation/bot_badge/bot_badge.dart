import 'package:flutter/material.dart';

import '../../../feature/bot_stock/utils/bot_stock_utils.dart';
import '../../styles/asklora_text_styles.dart';
import '../../utils/app_icons.dart';
import '../custom_text_new.dart';

class BotBadge extends StatefulWidget {
  final BotType botType;
  final Color? backgroundColor;
  final Color? textColor;

  const BotBadge(
      {required this.botType, this.backgroundColor, this.textColor, Key? key})
      : super(key: key);

  @override
  State<BotBadge> createState() => _BotBadgeState();
}

class _BotBadgeState extends State<BotBadge> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final double iconSize = 30;

  double currentPositionScroll = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAnimation();
    });
  }

  void startAnimation() async {
    if (mounted) {
      currentPositionScroll += 50;
      scrollController
          .animateTo(
            currentPositionScroll,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          )
          .then((value) => startAnimation());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 2),
      height: 50,
      color: widget.backgroundColor ?? widget.botType.primaryBgColor,
      child: ListView.builder(
        reverse: true,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                _getBotTypeIcon(),
                const SizedBox(
                  width: 5,
                ),
                CustomTextNew(
                  '${widget.botType.uppercaseName} BOTS',
                  style: AskLoraTextStyles.h3Italic.copyWith(
                      color:
                          widget.textColor ?? widget.botType.expiredTextColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                getSvgIcon('icon_bot_badge_pop_up_message_arrow',
                    color: widget.botType.expiredTextColor)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getBotTypeIcon() {
    switch (widget.botType) {
      case BotType.plank:
        return getSvgIcon('icon_bot_badge_pop_up_message_plank',
            color: widget.botType.expiredTextColor);
      case BotType.squat:
        return getSvgIcon('icon_bot_badge_pop_up_message_squat',
            color: widget.botType.expiredTextColor);
      case BotType.pullUp:
        return getSvgIcon('icon_bot_badge_pop_up_message_pull_up',
            color: widget.botType.expiredTextColor);
      default:
        return getSvgIcon('icon_bot_badge_pop_up_message_plank',
            color: widget.botType.expiredTextColor);
    }
  }
}
