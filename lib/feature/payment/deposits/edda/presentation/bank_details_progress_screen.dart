part of '../../shareable/bank_details/edda_bank_account_details_screen.dart';

class BankDetailsProgressScreen extends StatelessWidget {
  const BankDetailsProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BankDetailsBloc, BankDetailsState>(
        listener: (context, state) {
          if (state.response.state == ResponseState.success) {
            context.read<DepositBloc>().add(const PageChangedReplacement(
                DepositPageStep.eDdaBankDetailsSuccess));
          } else if (state.response.state == ResponseState.error) {
            showAlertDialog(context, state.response.message,
                onPressedOk: () =>
                    context.read<DepositBloc>().add(const PagePop()));
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
