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
            const BankAccountCard(),
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
