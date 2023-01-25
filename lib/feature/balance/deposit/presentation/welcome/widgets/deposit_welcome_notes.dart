part of '../deposit_welcome_screen.dart';

class DepositWelcomeNotes extends StatelessWidget {
  final DepositType depositType;

  const DepositWelcomeNotes(
      {this.depositType = DepositType.firstTime, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew(
          'Notes :',
          style:
              AskLoraTextStyles.body3.copyWith(color: AskLoraColors.charcoal),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Column(
            children: _getDepositNotes,
          ),
        )
      ],
    );
  }

  List<Widget> get _getDepositNotes {
    switch (depositType) {
      case DepositType.firstTime:
        return _firstTimeNotes;
      default:
        return _type1And2Notes;
    }
  }

  List<Widget> get _firstTimeNotes => [
        _depositNote(
          label: '1.',
          text:
              'We will take information collected from your bank via API or submitted remittance advice to determine your designated bank account. All future deposits and withdrawals are accepted ONLY through this designated bank account. You may change the designated bank account but you will need to go through the same verification by way of a minimum HK\$ 10,000 bank transfer is completed.',
        ),
        _depositNote(
          label: '2.',
          text:
              "Please add a HK bank account that is under your name; other people's bank accounts or joint accounts will not be accepted.",
        ),
        _depositNote(
          label: '3.',
          text:
              'We will only accept deposits via bank transfer (wire/FPS) from your own account.',
        ),
        _depositNote(
          label: '4.',
          text:
              'Any deposit less than HK\$10,000 will be rejected and fees will be charged.',
        ),
        _depositNote(
          label: '5.',
          text: 'We will only accept HKD.',
        ),
      ];

  List<Widget> get _type1And2Notes => [
        _depositNote(
          label: '1.',
          text:
              'We will work with your bank in order to identify your bank account details (account name, bank code, account number). However, we may require additional details from you for transaction verification purposes.',
        ),
        _depositNote(
          label: '2.',
          text:
              'Any deposit less than HK\$3,000 will be rejected and fees will be charged.',
        ),
      ];

  Widget _depositNote({required String label, required String text}) => Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: CustomExpandedRow(
          label,
          text: text,
          textStyle: AskLoraTextStyles.body3,
          flex1: 1,
          flex2: 20,
          textValueAlign: TextAlign.start,
        ),
      );
}
