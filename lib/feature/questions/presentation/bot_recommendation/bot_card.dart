part of 'bot_recommendation_screen.dart';

class BotCard extends StatelessWidget {
  final Function() onTap;
  final int index;
  final RecommendedBot recommendedBot;
  final bool selected;

  const BotCard(
      {required this.onTap,
      required this.index,
      required this.recommendedBot,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color fillColor = selected ? Colors.black : Colors.white10;
    final Color textColor = selected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: fillColor,
          border: const Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xffA5CAD7),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: CustomText(
                    (index + 1).toString(),
                    color: Colors.white,
                  ),
                )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          recommendedBot.botType,
                          color: textColor,
                          type: FontType.smallTextBold,
                          padding: const EdgeInsets.only(bottom: 6),
                        ),
                        CustomText(
                          recommendedBot.tickerName,
                          color: textColor,
                          type: FontType.smallTextBold,
                          maxLines: 1,
                          padding: const EdgeInsets.only(bottom: 2),
                        ),
                        CustomText(
                          recommendedBot.tickerSymbol,
                          color: textColor,
                          type: FontType.smallText,
                        ),
                      ],
                    ),
                  )),
                  Icon(
                    Icons.star_border_rounded,
                    color: textColor,
                    size: 28,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
