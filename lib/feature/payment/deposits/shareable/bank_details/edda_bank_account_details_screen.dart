import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/alert_dialog.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../bloc/bank_account_bloc.dart';
import '../../../domain/add_bank_account_request.dart';
import '../../../presentation/custom_payment_button_button.dart';
import '../../../presentation/custom_payment_text_information_widget.dart';
import '../../../presentation/custom_payment_text_input.dart';
import '../../bloc/deposit_bloc.dart';
import '../../bloc/navigation_bloc/navigation_bloc.dart';
import '../bank_list/domain/bank_details.dart';
import '../widget/custom_deposit_widget.dart';
import 'bloc/bank_details_bloc.dart';

part '../../edda/presentation/bank_details_progress_screen.dart';

part '../../edda/presentation/bank_details_success_screen.dart';

class EddaBankAccountDetailsScreen extends StatelessWidget {
  final BankDetails? bankDetails;

  const EddaBankAccountDetailsScreen(this.bankDetails, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BankAccountBloc, BankAccountState>(
        listenWhen: (previous, current) =>
            previous.response.state != current.response.state,
        listener: (context, state) {
          if (state.response.state == ResponseState.loading) {
            context.read<NavigationBloc<DepositPageStep>>().add(
                const PageChangedRemoveUntil(
                    DepositPageStep.eDdaBankDetailsProgress,
                    DepositPageStep.welcome));
          } else if (state.response.state == ResponseState.error) {
            showAlertDialog(context, state.response.message,
                onPressedOk: () => context
                    .read<NavigationBloc<DepositPageStep>>()
                    .add(const PagePop()));
          }
        },
        child: CustomDepositWidget(
            title: 'Your Bank Details',
            onBackPressed: () =>
                context.read<BankDetailsBloc>().add(const BankDetailsReset()),
            child: BlocBuilder<BankDetailsBloc, BankDetailsState>(
                builder: (context, state) => ListView(children: [
                      CustomPaymentTextInformationWidget(
                        key: const Key('edda_deposit_bank_details_bank_name'),
                        title: 'Bank Name',
                        label: _getBankDetails(),
                        paddingBottom: 18,
                      ),
                      CustomPaymentTextInput(
                        key: const Key(
                            'edda_deposit_bank_details_bank_account_number_input'),
                        hintText: 'Enter Your Bank Account Number',
                        titleText: 'Bank Account Number',
                        initialValue: state.bankAccountNumber,
                        textInputType: TextInputType.number,
                        textInputFormatterList: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) => context
                            .read<BankDetailsBloc>()
                            .add(BankAccountNumberChanged(value)),
                        paddingBottom: 18,
                      ),
                      CustomPaymentTextInput(
                        key: const Key(
                            'edda_deposit_bank_details_bank_confirm_account_number_input'),
                        hintText: 'Confirm Your Bank Account Number Again',
                        titleText: 'Confirm Bank Account Number',
                        textInputType: TextInputType.number,
                        textInputFormatterList: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        initialValue: state.confirmBankAccountNumber,
                        onChanged: (value) => context
                            .read<BankDetailsBloc>()
                            .add(ConfirmBankAccountNumberChanged(value)),
                        paddingBottom: 18,
                      ),
                      _text(
                          key: const Key('bank_details_minimum_amount_label'),
                          'Please Note that there is a minimum deposit amount of HKD10,000 when adding a new bank account',
                          fontType: FontType.smallTextBold),
                      _text(
                          key: const Key('bank_details_continue_button_label'),
                          r"By clicking 'Continue', you indicate that you have read and agreed to the bound by the General Client Agreement and the associated terms with Electronic Direct Debit Authorization",
                          bottomPadding: 0),
                      CustomPaymentButton(
                        key: const Key(
                            'edda_deposit_bank_details_continue_button'),
                        disable: state.bankAccountNumber.isEmpty ||
                            state.confirmBankAccountNumber.isEmpty ||
                            state.confirmBankAccountNumberErrorText.isNotEmpty,
                        title: 'Continue',
                        onSubmit: () => context.read<BankAccountBloc>().add(
                            BankAccountSubmitted(
                                addBankAccountRequest: AddBankAccountRequest(
                                    name: bankDetails!.bankName,
                                    bankCodeType: 'HKD',
                                    accountName: state.bankAccountName,
                                    accountNumber: state.bankAccountNumber,
                                    bankCode: bankDetails?.swiftBic ?? '',
                                    bankTransferType: context
                                            .read<DepositBloc>()
                                            .state
                                            .depositMethod
                                            ?.value ??
                                        ''),
                                shouldValidateName: false)),
                      )
                    ]))));
  }

  String _getBankDetails() {
    return '${bankDetails?.bankName}  ${bankDetails?.clearingCode}';
  }

  Widget _text(String text,
          {FontType fontType = FontType.smallText,
          Key key = const Key(''),
          double bottomPadding = 18}) =>
      CustomText(
        key: key,
        text,
        padding: EdgeInsets.only(top: 10, bottom: bottomPadding),
        type: fontType,
      );
}
