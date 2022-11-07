import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/alert_dialog.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/photo_view_screen.dart';
import '../../../presentation/custom_payment_button_button.dart';
import '../../../presentation/custom_payment_text_input.dart';
import '../../bloc/deposit_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../widget/custom_row_text.dart';
import 'bloc/upload_proof_of_remittance_bloc.dart';

class UploadProofOfRemittanceScreen extends StatelessWidget {
  const UploadProofOfRemittanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositBloc, DepositState>(
        buildWhen: (_, __) => false,
        builder: (context, state) => CustomNavigationWidget<DepositPageStep>(
              title: 'Upload Proof of Remittance',
              navigationButton: BlocConsumer<UploadProofOfRemittanceBloc,
                  UploadProofofRemittanceState>(
                listener: (context, state) {
                  if (state.response.state == ResponseState.error) {
                    showAlertDialog(context, state.response.message);
                  } else if (state.response.state == ResponseState.success) {
                    context.read<NavigationBloc<DepositPageStep>>().add(
                        const PageChangedRemoveUntil(
                            DepositPageStep.eDdaAcknowledged,
                            DepositPageStep.welcome));
                  }
                },
                builder: (context, state) => CustomPaymentButton(
                  isLoading: state.response.state == ResponseState.loading,
                  key: const Key(
                      'deposit_upload_proof_of_remittance_submit_button'),
                  disable:
                      state.documentFiles.isNotEmpty && state.depositAmount > 0
                          ? false
                          : true,
                  title: 'Submit',
                  onSubmit: () => context
                      .read<UploadProofOfRemittanceBloc>()
                      .add(const SubmitProofofRemittance()),
                ),
              ),
              child: ListView(
                children: [
                  _text(
                    'Please upload your proof of remittance below. This helps us verify your deposit. The proof of remittance should contain :',
                  ),
                  _rowText('1', 'The deposit amount'),
                  _rowText('2', 'Your account name'),
                  _rowText('3', 'Your bank account no.'),
                  _rowText(
                    '4',
                    'A transaction reference. Please put your User ID (XXXXX) as your transaction reference',
                  ),
                  _text(
                    'It can be a screenshot from your bank app or a receipt. Please see the sample screenshot below for an example',
                  ),
                  _depositAmountInput(context),
                  _uploadDocument(
                      'Upload Document',
                      InkWell(
                        onTap: () => context
                            .read<UploadProofOfRemittanceBloc>()
                            .add(const PickFile()),
                        child: const Icon(
                          Icons.add_circle_outline,
                          key: Key(
                              'deposit_upload_proof_of_remittance_add_button'),
                          color: Colors.grey,
                          size: 42,
                        ),
                      )),
                  _uploadDocument('Sample Document', BlocBuilder<
                      UploadProofOfRemittanceBloc,
                      UploadProofofRemittanceState>(
                    builder: (context, state) {
                      if (state.documentFiles.isNotEmpty) {
                        return Column(
                          children: state.documentFiles
                              .map((element) => GestureDetector(
                                    onTap: () => PhotoViewScreen.open(context,
                                        FileImage(File(element.path!))),
                                    child: Image.file(
                                      key: const Key(
                                          'deposit_upload_proof_of_remittance_image'),
                                      File(element.path!),
                                      height: 150,
                                    ),
                                  ))
                              .toList(),
                        );
                      } else {
                        return const CustomText('Image');
                      }
                    },
                  )),
                ],
              ),
            ));
  }

  Widget _text(String text, {FontType fontType = FontType.smallText}) =>
      CustomText(
        text,
        padding: const EdgeInsets.only(top: 10, bottom: 50),
        type: fontType,
      );

  Widget _rowText(String index, String text,
          {FontType fontType = FontType.smallText}) =>
      CustomRowText(
        index: index,
        text: text,
        padding: const EdgeInsets.only(bottom: 3),
        fontType: fontType,
      );

  Widget _depositAmountInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 36),
        child: CustomPaymentTextInput(
            key: const Key('deposit_amount_input'),
            titleText: 'Deposit Amount',
            textInputType: TextInputType.number,
            textInputFormatterList: [FilteringTextInputFormatter.digitsOnly],
            prefixText: 'HKD',
            paddingBottom: 6,
            hintText: 'Enter Amount',
            onChanged: (value) => context
                .read<UploadProofOfRemittanceBloc>()
                .add(DepositAmountChanged(
                    value.isNotEmpty ? double.parse(value) : 0))),
      );

  Widget _uploadDocument(String title, Widget content) => Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
      margin: const EdgeInsets.only(top: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            title,
            type: FontType.smallText,
          ),
          const SizedBox(
            height: 24,
          ),
          content
        ],
      ));
}
