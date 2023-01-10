import 'package:flutter/material.dart';
import '../../../feature/bot_stock/utils/bot_stock_utils.dart';
import '../../styles/asklora_text_styles.dart';
import '../custom_text_new.dart';

class BotBadge extends StatefulWidget {
  final BotType botType;

  const BotBadge({required this.botType, Key? key}) : super(key: key);

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
      color: widget.botType.primaryBgColor,
      child: ListView.builder(
        reverse: true,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_people,
                  size: iconSize,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomTextNew(
                  '${widget.botType.name} BOTS',
                  style: AskLoraTextStyles.h3Italic
                      .copyWith(color: widget.botType.expiredTextColor),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: iconSize,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
