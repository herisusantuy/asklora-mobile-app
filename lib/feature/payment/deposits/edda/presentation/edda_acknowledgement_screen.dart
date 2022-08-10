import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/deposit_bloc.dart';
import '../../shareable/widget/custom_deposit_widget.dart';
import '../bloc/amount/amount_bloc.dart';

class EddaAcknowledgementScreen extends StatelessWidget {
  const EddaAcknowledgementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AmountBloc, AmountState>(
        listener: (context, state) {
          if (state.response == ResponseState.success) {
            context
                .read<DepositBloc>()
                .add(const PageChanged(DepositPageStep.eDdaFinished));
          }
        },
        child: CustomDepositWidget(
          crossAxisAlignment: CrossAxisAlignment.center,
          header: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const CustomText(
                    'Done',
                    type: FontType.bodyTextBold,
                  )),
            ),
          ),
          child: ListView(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 48, bottom: 48),
                color: Colors.grey[300],
                child: const Center(
                  child: CustomText(
                    '-Image-',
                    key: Key('edda_deposit_acknowledgement_image'),
                    type: FontType.bodyText,
                  ),
                ),
              ),
              _text('Acknowledgement',
                  fontType: FontType.h5, bottomPadding: 12),
              _text(
                  "We're processing your transaction. It'll only take a few seconds.",
                  bottomPadding: 32),
              _rowText('Bank Name',
                  '004 The Hong Kong and Shanghai Banking Corporation Limited'),
              _rowText('Account Number', '*******7890'),
            ],
          ),
        ));
  }

  Widget _text(String text,
          {FontType fontType = FontType.smallText,
          double bottomPadding = 0,
          TextAlign textAlign = TextAlign.center}) =>
      CustomText(
        text,
        padding: EdgeInsets.only(bottom: bottomPadding),
        type: fontType,
        textAlign: textAlign,
      );

  Widget _rowText(String firstText, String secondText) => Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          children: [
            Expanded(child: _text(firstText, textAlign: TextAlign.left)),
            Expanded(child: _text(secondText)),
          ],
        ),
      );
}
