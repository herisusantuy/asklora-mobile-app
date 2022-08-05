import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/alert_dialog.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../presentation/custom_payment_button_button.dart';
import '../../../presentation/custom_payment_text_information_widget.dart';
import '../../../presentation/custom_payment_text_input.dart';
import '../../bloc/deposit_bloc.dart';
import '../../shareable/bank_list/domain/bank_details.dart';
import '../../shareable/widget/custom_deposit_widget.dart';
import '../bloc/bank_details/bank_details_bloc.dart';

part 'bank_details_progress_screen.dart';

part 'bank_details_success_screen.dart';

class BankDetailsScreen extends StatelessWidget {
  final BankDetails? bankDetails;

  const BankDetailsScreen(this.bankDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BankDetailsBloc, BankDetailsState>(
      listenWhen: (context, state) =>
          (state.response.state == ResponseState.loading ||
              state.response.state == ResponseState.error),
      listener: (context, state) {
        if (state.response.state == ResponseState.loading) {
          context
              .read<DepositBloc>()
              .add(const PageChanged(DepositPageStep.eDdaBankDetailsProgress));
        } else if (state.response.state == ResponseState.error) {
          showAlertDialog(context, state.response.message,
              onPressedOk: () => context
                  .read<BankDetailsBloc>()
                  .add(BankAccountNumberChanged(state.bankAccountNumber)));
        }
      },
      child: CustomDepositWidget(
        title: 'Your Bank Details',
        backTo: DepositPageStep.selectBank,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            CustomPaymentTextInformationWidget(
              key: const Key('deposit_bank_details_bank_name'),
              title: 'Bank Name',
              label: _getBankDetails(),
              paddingBottom: 18,
            ),
            CustomPaymentTextInput(
              key: const Key('deposit_bank_details_bank_account_number_input'),
              hintText: 'Enter Your Bank Account Number',
              titleText: 'Bank Account Number',
              textInputType: TextInputType.number,
              textInputFormatterList: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) => context
                  .read<BankDetailsBloc>()
                  .add(BankAccountNumberChanged(value)),
              paddingBottom: 18,
            ),
            CustomPaymentTextInput(
              key: const Key(
                  'deposit_bank_details_bank_confirm_account_number_input'),
              hintText: 'Confirm Your Bank Account Number Again',
              titleText: 'Confirm Bank Account Number',
              textInputType: TextInputType.number,
              textInputFormatterList: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) => context
                  .read<BankDetailsBloc>()
                  .add(ConfirmBankAccountNumberChanged(value)),
              paddingBottom: 18,
            ),
            _text(
                'Please Note that there is a minimum deposit amount of HKD10,000 when adding a new bank account',
                fontType: FontType.smallTextBold),
            _text(
                r"By clicking 'Continue', you indicate that you have read and agreed to the bound by the General Client Agreement and the associated terms with Electronic Direct Debit Authorization",
                bottomPadding: 0),
            BlocBuilder<BankDetailsBloc, BankDetailsState>(
                builder: (context, state) => CustomPaymentButton(
                      key: const Key('deposit_bank_details_continue_button'),
                      disable: state.bankAccountNumber.isEmpty ||
                          state.confirmBankAccountNumber.isEmpty,
                      title: 'Continue',
                      onSubmit: () => context
                          .read<BankDetailsBloc>()
                          .add(const BankDetailsSubmitted()),
                    ))
          ])))
        ],
      ),
    );
  }

  String _getBankDetails() {
    return '${bankDetails?.bankName}  ${bankDetails?.clearingCode}';
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
