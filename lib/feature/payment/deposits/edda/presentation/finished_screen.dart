import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../presentation/widget/custom_deposit_widget.dart';
import '../bloc/amount/amount_bloc.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
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
              key: Key('edda_deposit_finished_image'),
              type: FontType.bodyText,
            ),
          ),
        ),
        _text(r'CA$H MON€Y', fontType: FontType.h5, bottomPadding: 12),
        BlocBuilder<AmountBloc, AmountState>(
            buildWhen: (_, __) => false,
            builder: (context, state) =>
                _text('HKD${state.depositHKDAmount}', bottomPadding: 32)),
        _text('EZ MONEY. See how easy that was?', bottomPadding: 32),
      ],
    );
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
}
