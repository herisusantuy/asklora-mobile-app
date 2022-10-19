import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../bloc/bank_account_bloc.dart';
import '../../domain/registered_bank_accounts.dart';
import '../bloc/deposit_bloc.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';

class DepositMethodScreen extends StatelessWidget {
  final BankAccountState bankAccountState;

  const DepositMethodScreen(this.bankAccountState, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<DepositPageStep>(
      title: 'Deposit Method',
      child: BlocListener<DepositBloc, DepositState>(
        listenWhen: (_, current) =>
            current.depositEvent is DepositMethodSelected,
        listener: (context, state) {
          DepositPageStep depositPageStep;
          RegisteredBankAccounts registeredBankAccounts =
              bankAccountState.response.data!;
          if (state.depositMethod == DepositMethod.fps &&
              registeredBankAccounts.fpsBankAccounts!.isEmpty) {
            depositPageStep = DepositPageStep.fpsTransfer;
          } else if (state.depositMethod == DepositMethod.wire &&
              registeredBankAccounts.wireBankAccounts!.isEmpty) {
            depositPageStep = DepositPageStep.wireTransfer;
          } else {
            depositPageStep = DepositPageStep.returningUser;
          }
          context
              .read<NavigationBloc<DepositPageStep>>()
              .add(PageChanged(depositPageStep));
        },
        child: ListView(
          children: [
            const CustomText(
              'Please select method of deposit',
              padding: EdgeInsets.only(top: 10, bottom: 50),
              type: FontType.h4,
            ),
            _wireTransferButton(context),
            _fpsButton(context),
            _whatIsFpsButton(context),

            ///TODO hide edda method for now according to new payment flow
            // _initiateEddaButton(context),
            // _whatIsEddaButton(context)
          ],
        ),
      ),
    );
  }

  Widget _wireTransferButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: CustomTextButton(
            key: const Key('wire_transfer_button'),
            borderRadius: 5,
            buttonText: 'WIRE TRANSFER',
            onClick: () => context
                .read<DepositBloc>()
                .add(const DepositMethodSelected(DepositMethod.wire))));
  }

  Widget _initiateEddaButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomTextButton(
            key: const Key('edda_button'),
            borderRadius: 5,
            buttonText: 'Electronic Direct Debit Authorization (eDDA)',
            onClick: () => context
                .read<DepositBloc>()
                .add(const DepositMethodSelected(DepositMethod.eDda))));
  }

  Widget _fpsButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: CustomTextButton(
            key: const Key('fps_button'),
            borderRadius: 5,
            buttonText: 'FPS',
            onClick: () => context
                .read<DepositBloc>()
                .add(const DepositMethodSelected(DepositMethod.fps))));
  }

  Widget _whatIsFpsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
          key: const Key('what_is_fps_button'),
          child: const CustomText('What is FPS?'),
          onTap: () => context
              .read<NavigationBloc<DepositPageStep>>()
              .add(const PageChanged(DepositPageStep.fpsMeaning))),
    );
  }

  Widget _whatIsEddaButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
          key: const Key('what_is_edda_button'),
          child: const CustomText('What is eDDA?'),
          onTap: () => context
              .read<NavigationBloc<DepositPageStep>>()
              .add(const PageChanged(DepositPageStep.eDdaMeaning))),
    );
  }
}
