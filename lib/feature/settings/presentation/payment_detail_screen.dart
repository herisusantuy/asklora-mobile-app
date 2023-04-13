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
import '../../onboarding/kyc/repository/account_repository.dart';
import '../bloc/account_information/account_information_bloc.dart';

class PaymentDetailScreen extends StatelessWidget {
  static const route = '/payment_details';
  const PaymentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountInformationBloc(accountRepository: AccountRepository())
            ..add(GetAccountInformation()),
      child: BlocConsumer<AccountInformationBloc, AccountInformationState>(
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
            return CustomScaffold(
              body: CustomStretchedLayout(
                  header: CustomHeader(title: S.of(context).paymentDetails),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextNew(S.of(context).yourBankAccount,
                          style: AskLoraTextStyles.body1),
                      //* This widget will shown if account status == "Waiting for acc approval"
                      // CustomTextNew(S.of(context).yourBankAccountIsUnderReview('2023/03/23'),
                      // style: AskLoraTextStyles.body1),
                      const SizedBox(height: 32),
                      _bankDetails,
                      //* This widget will shown if account status == "Account Approved"
                      const SizedBox(height: 32),
                      _changeBankButton,
                      const SizedBox(height: 32),
                      CustomTextNew(S.of(context).noteOnPaymentDetails,
                          style: AskLoraTextStyles.body3)
                    ],
                  )),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget get _bankDetails {
    return BlocBuilder<AccountInformationBloc, AccountInformationState>(
      buildWhen: (previous, current) =>
          previous.response.state != current.response.state,
      builder: (context, state) {
        return RoundColoredBox(
            content: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextNew('Hang Seng Bank Limited',
                  style: AskLoraTextStyles.h6),
              const SizedBox(height: 5),
              CustomTextNew('123 - 12356789 - 07',
                  style: AskLoraTextStyles.body1),
              const SizedBox(height: 20),
              CustomTextNew(
                  '${state.response.data?.personalInfo?.firstName} ${state.response.data?.personalInfo?.lastName}',
                  style: AskLoraTextStyles.body1),
            ],
          ),
        ));
      },
    );
  }

  Widget get _changeBankButton {
    return Builder(builder: (context) {
      return GestureDetector(
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
    });
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
