import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/widget/custom_deposit_widget.dart';
import '../../presentation/widget/custom_row_text.dart';

import '../../presentation/widget/deposit_next_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../bloc/deposit_bloc.dart';
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
                  key: const Key(
                      'deposit_upload_proof_of_remittance_next_button'),
                  nextTo: DepositPages.depositMethod,
                  disable: state.documentFile != null ? false : true,
                ),
              ),
              children: [
                const CustomText(
                  'Upload Proof of Remittance',
                  padding: EdgeInsets.only(top: 10, bottom: 50),
                  type: FontType.h2,
                ),
                const CustomText(
                  'Please upload your proof of remittance below. This helps us verify your deposit. The proof of remittance should contain :',
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  type: FontType.smallText,
                ),
                const CustomRowText(
                  index: '1',
                  text: 'The deposit amount',
                  padding: EdgeInsets.only(bottom: 3),
                  fontType: FontType.smallText,
                ),
                const CustomRowText(
                  index: '2',
                  text: 'Your account name',
                  padding: EdgeInsets.only(bottom: 3),
                  fontType: FontType.smallText,
                ),
                const CustomRowText(
                  index: '3',
                  text: 'Your bank account no.',
                  padding: EdgeInsets.only(bottom: 3),
                  fontType: FontType.smallText,
                ),
                const CustomRowText(
                  index: '4',
                  text:
                      'A transaction reference. Please put your User ID (XXXXX) as your transaction reference',
                  padding: EdgeInsets.only(bottom: 3),
                  fontType: FontType.smallText,
                ),
                const CustomText(
                  'It can be a screenshot from your bank app or a receipt. Please see the sample screenshot below for an example',
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  type: FontType.smallText,
                ),
                _customContainer(
                    'Upload Document',
                    InkWell(
                      onTap: () => context
                          .read<DepositUploadProofOfRemittanceBloc>()
                          .add(const PickFile()),
                      child: BlocBuilder<DepositUploadProofOfRemittanceBloc,
                          DepositUploadProofofRemittanceState>(
                        builder: (context, state) {
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
                _customContainer('Sample Document', const CustomText('Image')),
              ],
            ));
  }

  Widget _customContainer(String title, Widget content) => Container(
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
