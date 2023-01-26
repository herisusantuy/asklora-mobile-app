part of '../deposit_welcome_screen.dart';

class DepositBankAccount extends StatelessWidget {
  final Widget spaceHeightSmall;
  final Widget spaceHeight;
  final DepositType depositType;

  const DepositBankAccount(
      {required this.depositType,
      required this.spaceHeightSmall,
      required this.spaceHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (depositType) {
      case DepositType.firstTime:
        return const SizedBox.shrink();
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: RoundColoredBox(
                title: 'Hang Seng Bank Limited',
                content: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(children: [
                    CustomTextNew(
                      '123 - 1256789 - 07',
                      style: AskLoraTextStyles.body2
                          .copyWith(color: AskLoraColors.charcoal),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextNew(
                      'Lillian Lambert',
                      style: AskLoraTextStyles.body2
                          .copyWith(color: AskLoraColors.charcoal),
                      maxLines: 2,
                    ),
                  ]),
                ),
              ),
            ),
            spaceHeightSmall,
            GestureDetector(
              onTap: () => DepositWelcomeScreen.open(
                context: context,
                depositType: DepositType.firstTime,
              ),
              child: CustomTextNew(
                'CHANGE BANK ACC',
                style: AskLoraTextStyles.subtitle2.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            spaceHeight,
          ],
        );
    }
  }
}
