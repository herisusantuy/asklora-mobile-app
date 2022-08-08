part of '../../shareable/bank_details/bank_details_screen.dart';

class BankDetailsSuccessScreen extends StatelessWidget {
  const BankDetailsSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BankDetailsBloc, BankDetailsState>(
        listener: (context, state) {
          if (state.response.data == CompleteStep.secondStep) {
            context
                .read<DepositBloc>()
                .add(const PageChanged(DepositPageStep.eDdaDepositAmount));
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
