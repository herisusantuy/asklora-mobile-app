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

  late Animation<double> animation;
  final double paddingBetweenInfiniteBadge = 12;
  final double paddingBetweenIcon1AndText = 10;
  final double paddingBetweenTextAndIcon2 = 8;
  final double iconSize = 30;
  double currentPositionScroll = 0;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _infiniteScroll();
    });
  }

  void _infiniteScroll() {
    animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(
            begin: currentPositionScroll, end: currentPositionScroll + 1000)
        .animate(animationController!)
      ..addListener(() {
        currentPositionScroll = animation.value;
        if (scrollController.hasClients) {
          scrollController.jumpTo(animation.value);
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController!.dispose();
          _infiniteScroll();
        } else if (status == AnimationStatus.dismissed) {
          animationController!.dispose();
        }
      });

    animationController!.forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
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
            padding: EdgeInsets.only(right: paddingBetweenInfiniteBadge),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_people,
                  size: iconSize,
                ),
                SizedBox(
                  width: paddingBetweenIcon1AndText,
                ),
                CustomTextNew(
                  '${widget.botType.name} BOTS',
                  style: AskLoraTextStyles.h3Italic
                      .copyWith(color: widget.botType.expiredTextColor),
                ),
                SizedBox(
                  width: paddingBetweenTextAndIcon2,
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
