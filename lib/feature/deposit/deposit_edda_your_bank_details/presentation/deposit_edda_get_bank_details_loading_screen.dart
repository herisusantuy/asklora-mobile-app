part of 'deposit_edda_your_bank_details_screen.dart';

class DepositEddaGetBankDetailsLoadingScreen extends StatelessWidget {
  const DepositEddaGetBankDetailsLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepositEddaYourBankDetailsBloc,
            DepositEddaYourBankDetailsState>(
        listener: (context, state) {
          if (state.response.data == CompleteStep.firstStep) {
            context.read<DepositBloc>().add(
                const PageChanged(DepositPageStep.eddaGetBankDetailsSuccess));
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomText(
                'Great!',
                type: FontType.h2,
                padding: EdgeInsets.only(bottom: 20),
              ),
              CustomText(
                'We\'re doing our magic now. Just shut up and wait',
                padding: EdgeInsets.only(bottom: 20),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.downloading_outlined,
                key: Key('deposit_edda_get_bank_details_loading_image'),
                size: 60,
                color: Colors.blueAccent,
              )
            ],
          ),
        ));
  }
}
