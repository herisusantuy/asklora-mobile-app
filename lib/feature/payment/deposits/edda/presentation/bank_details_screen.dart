import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../presentation/custom_payment_button_button.dart';
import '../../../presentation/custom_payment_text_input.dart';
import '../../../withdrawal/presentation/widget/custom_withdrawal_text_information_widget.dart';
import '../../bloc/deposit_bloc.dart';
import '../../presentation/widget/custom_deposit_widget.dart';
import '../bloc/bank_details/bank_details_bloc.dart';

part 'bank_details_progress_screen.dart';

part 'bank_details_success_screen.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BankDetailsBloc, BankDetailsState>(
      listener: (context, state) {
        if (state.response == BaseResponse.loading()) {
          context
              .read<DepositBloc>()
              .add(const PageChanged(DepositPageStep.eDdaBankDetailsProgress));
        }
      },
      child: CustomDepositWidget(
        backTo: DepositPageStep.depositMethod,
        navigationButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              _text(
                  'By clicking \'Continue\', you indicate that you have read and agreed to the bound by the General Client Agreement and the associated terms with Electronic Direct Debit Authorization',
                  bottomPadding: 0),
              BlocBuilder<BankDetailsBloc, BankDetailsState>(
                  builder: (context, state) => CustomPaymentButton(
                        key: const Key('deposit_bank_details_continue_button'),
                        disable: state.bankAccountNumber.isEmpty,
                        title: 'Continue',
                        onSubmit: () => context
                            .read<BankDetailsBloc>()
                            .add(const BankDetailsSubmitted()),
                      ))
            ],
          ),
        ),
        children: [
          _text('Your Bank Details', fontType: FontType.h2),
          const CustomPaymentTextInformationWidget(
            key: Key('deposit_bank_details_bank_name'),
            title: 'Bank Name',
            label:
                'THE HONG KONG AND SHANGHAI BANKING CORPORATION LIMITED (004)..',
            paddingBottom: 30,
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
            paddingBottom: 30,
          ),
          _text(
              'Please Note that there is a minimum deposit amount of HKD10,000 when adding a new bank account',
              fontType: FontType.smallTextBold)
        ],
      ),
    );
  }

  Widget _text(String text,
          {FontType fontType = FontType.smallText,
          double bottomPadding = 40}) =>
      CustomText(
        text,
        padding: EdgeInsets.only(top: 10, bottom: bottomPadding),
        type: fontType,
      );
}
