part of '../../deposit_screen.dart';

class UploadProofOfRemittanceStep extends StatelessWidget {
  const UploadProofOfRemittanceStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DepositBaseStep(
      drawLine: false,
      contents: [
        CustomTextNew(
          'Upload proof of remittance',
          style: AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextNew(
          'The remittance advice should show your bank account number, full name, and amount.',
          style:
              AskLoraTextStyles.body2.copyWith(color: AskLoraColors.charcoal),
        ),
        const SizedBox(
          height: 18,
        ),
        BlocBuilder<DepositBloc, DepositState>(
          buildWhen: (previous, current) =>
              previous.uploadProofOfRemittanceImages !=
              current.uploadProofOfRemittanceImages,
          builder: (context, state) => CustomImagePicker(
            initialValue: state.uploadProofOfRemittanceImages,
            key: const Key('upload_proof_of_remittance'),
            onImageDeleted: (image) => context
                .read<DepositBloc>()
                .add(ProofOfRemittanceImageDeleted(image)),
            onImagePicked: (images) => context
                .read<DepositBloc>()
                .add(ProofOfRemittanceImagesChanged(images)),
          ),
        ),
      ],
    );
  }
}
