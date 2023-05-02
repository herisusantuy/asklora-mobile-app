import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_in_app_notification.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../core/presentation/round_colored_box.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../generated/l10n.dart';
import '../../payment/bloc/bank_account_bloc.dart';
import '../../payment/domain/get_bank_account_response.dart';
import '../../payment/repository/bank_account_repository.dart';

class PaymentDetailScreen extends StatelessWidget {
  static const route = '/payment_details';

  const PaymentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BankAccountBloc(bankAccountRepository: BankAccountRepository())
            ..add(const RegisteredBankAccountCheck()),
      child: BlocConsumer<BankAccountBloc, BankAccountState>(
        listenWhen: (previous, current) =>
            previous.response.state != current.response.state,
        listener: (context, state) {
          CustomLoadingOverlay.of(context).show(state.response.state);
          switch (state.response.state) {
            case ResponseState.error:
              CustomInAppNotification.show(context, state.response.message);
              break;
            case ResponseState.success:
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          if (state.response.state == ResponseState.success) {
            List<GetBankAccountResponse> response =
                state.response.data as List<GetBankAccountResponse>;
            return CustomScaffold(
              body: CustomStretchedLayout(
                  header: CustomHeader(title: S.of(context).paymentDetails),
                  content: response.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextNew(S.of(context).yourBankAccount,
                                style: AskLoraTextStyles.body1),
                            const SizedBox(height: 32),
                            _getBankDetails(response[0]),
                            const SizedBox(height: 32),
                            _changeBankButton(context),
                            const SizedBox(height: 32),
                            CustomTextNew(S.of(context).noteOnPaymentDetails,
                                style: AskLoraTextStyles.body3)
                          ],
                        )
                      : CustomTextNew(
                          S.of(context).yourPaymentInformationIsUnderReview,
                          style: AskLoraTextStyles.body1)),
            );
          } else {
            // TODO : will update UI when response get error
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _getBankDetails(GetBankAccountResponse response) => RoundColoredBox(
          content: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(response.name!, style: AskLoraTextStyles.h6),
            const SizedBox(height: 5),
            CustomTextNew(response.accountNumber!,
                style: AskLoraTextStyles.body1),
            const SizedBox(height: 20),
            CustomTextNew(response.accountName!,
                style: AskLoraTextStyles.body1),
          ],
        ),
      ));

  Widget _changeBankButton(BuildContext context) => GestureDetector(
        onTap: () => CustomInAppNotification.show(
            context, 'This feature will be available soon! Please wait 😁'),
        child: UnconstrainedBox(
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: .5))),
            child: CustomTextNew(S.of(context).changeBankAccount,
                style: AskLoraTextStyles.h6),
          ),
        ),
      );

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
