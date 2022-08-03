part of 'deposit_edda_your_bank_details_screen.dart';

class DepositEddaGetBankDetailsSuccessScreen extends StatelessWidget {
  const DepositEddaGetBankDetailsSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepositEddaYourBankDetailsBloc,
            DepositEddaYourBankDetailsState>(
        listener: (context, state) {
          if (state.response.data == CompleteStep.secondStep) {
            context
                .read<DepositBloc>()
                .add(const PageChanged(DepositPageStep.eddaDepositAmount));
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
        ));
  }
}
