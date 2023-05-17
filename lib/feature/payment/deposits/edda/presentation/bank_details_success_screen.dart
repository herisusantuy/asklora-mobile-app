part of '../../shareable/bank_details/edda_bank_account_details_screen.dart';

class BankDetailsSuccessScreen extends StatelessWidget {
  const BankDetailsSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _delayedNextStep(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            'Nice',
            type: FontType.h2,
            padding: EdgeInsets.only(bottom: 20),
          ),
          CustomText(
            'Some text about it being done',
            padding: EdgeInsets.only(bottom: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _delayedNextStep(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) => context
        .read<NavigationBloc<DepositPageStep>>()
        .add(const PageChangedReplacement(DepositPageStep.eDdaDepositAmount)));
  }
}
