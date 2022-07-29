import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../bloc/deposit_bloc.dart';
import '../../presentation/widget/custom_deposit_widget.dart';
import '../../presentation/widget/custom_row_text.dart';
import '../../presentation/widget/deposit_next_button.dart';
import '../bloc/deposit_upload_proof_of_remittance_bloc.dart';

class DepositUploadProofOfRemittanceScreen extends StatelessWidget {
  const DepositUploadProofOfRemittanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositBloc, DepositState>(
        buildWhen: (_, __) => false,
        builder: (context, state) => CustomDepositWidget(
              backTo: state.previousDepositPages,
              navigationButton: BlocBuilder<DepositUploadProofOfRemittanceBloc,
                  DepositUploadProofofRemittanceState>(
                builder: (context, state) => DepositNextButton(
                  label: 'Submit',
                  key: const Key(
                      'deposit_upload_proof_of_remittance_next_button'),
                  nextTo: DepositPageStep.acknowledged,
                  disable: state.documentFile != null ? false : true,
                ),
              ),
              children: [
                _text(
                  'Upload Proof of Remittance',
                  fontType: FontType.h2,
                ),
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
                _uploadDocument(
                    'Upload Document',
                    InkWell(
                      onTap: () => context
                          .read<DepositUploadProofOfRemittanceBloc>()
                          .add(const PickFile()),
                      child: BlocBuilder<DepositUploadProofOfRemittanceBloc,
                          DepositUploadProofofRemittanceState>(
                        builder: (context, state) {
                          debugPrint('Krishna pick file ${state}');
                          if (state.documentFile != null) {
                            return Image.file(
                              key: const Key(
                                  'deposit_upload_proof_of_remittance_image'),
                              File(state.documentFile!.path!),
                              height: 150,
                            );
                          } else {
                            return const Icon(
                              Icons.add_circle_outline,
                              key: Key(
                                  'deposit_upload_proof_of_remittance_add_button'),
                              color: Colors.grey,
                              size: 42,
                            );
                          }
                        },
                      ),
                    )),
                _uploadDocument('Sample Document', const CustomText('Image')),
              ],
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
