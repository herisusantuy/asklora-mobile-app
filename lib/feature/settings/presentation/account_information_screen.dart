import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_in_app_notification.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../generated/l10n.dart';
import '../../onboarding/kyc/repository/account_repository.dart';
import '../bloc/account_information/account_information_bloc.dart';
import '../domain/get_account_details_response.dart';

class AccountInformationScreen extends StatelessWidget {
  static const route = '/account_information_screen';
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountInformationBloc(accountRepository: AccountRepository())
            ..add(GetAccountInformation()),
      child: BlocListener<AccountInformationBloc, AccountInformationState>(
        listenWhen: (previous, current) =>
            previous.response.state != current.response.state,
        listener: (context, state) {
          CustomLoadingOverlay.of(context).show(state.response.state);
          switch (state.response.state) {
            case ResponseState.error:
              CustomInAppNotification.show(context, state.response.message);
              break;
            default:
              break;
          }
        },
        child: CustomScaffold(
          body: CustomStretchedLayout(
            header: CustomHeader(title: S.of(context).accountInformation),
            content:
                BlocBuilder<AccountInformationBloc, AccountInformationState>(
              builder: (context, state) {
                // GetAccountDetailsResponse account =
                //     const GetAccountDetailsResponse();
                // if (state.response.state == ResponseState.success) {
                //   account = state.response.data!;
                // }
                GetAccountDetailsResponse account =
                    state.response.data ?? const GetAccountDetailsResponse();
                return Column(
                  children: [
                    // _accountDetails(S.of(context).userId,
                    //     account.id == 0 ? '-' : account.id.toString()),
                    // const SizedBox(height: 40),
                    // _accountDetails(S.of(context).fullName,
                    //     '${account.personalInfo.firstName} ${account.personalInfo.lastName}'),
                    // const SizedBox(height: 40),
                    // _accountDetails(S.of(context).phone,
                    //     '(852) ${account.personalInfo.phoneNumber ?? '-'}'),
                    // const SizedBox(height: 40),
                    // _accountDetails(S.of(context).email, account.email),
                    // const SizedBox(height: 40),
                    _accountDetails(S.of(context).dateJoined, '-'),
                    _accountDetails(
                        S.of(context).userId, account.id.toString()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _accountDetails(String label, String value) => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(
              label,
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.darkGray),
            ),
            const SizedBox(height: 12),
            CustomTextNew(value, style: AskLoraTextStyles.body1),
          ],
        ),
      );

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
