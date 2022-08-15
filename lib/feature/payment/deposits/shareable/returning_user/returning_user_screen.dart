import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../presentation/custom_payment_text_information_widget.dart';
import '../../bloc/deposit_bloc.dart';
import '../widget/custom_deposit_widget.dart';

class ReturningUserScreen extends StatelessWidget {
  const ReturningUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
      title: _getTitle(context),
      child: ListView(
        children: [
          _text('Select Bank Account'),
          const CustomPaymentTextInformationWidget(
            label: '',
            title: '',
          )
        ],
      ),
    );
  }

  String _getTitle(BuildContext context) {
    return '${context.read<DepositBloc>().state.depositMethod?.name} Transfer';
  }

  Widget _text(String text,
          {FontType fontType = FontType.smallText,
          double bottomPadding = 18}) =>
      CustomText(
        text,
        padding: EdgeInsets.only(top: 10, bottom: bottomPadding),
        type: fontType,
      );
}
