import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/endpoints.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_expanded_row.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../onboarding/kyc/presentation/widgets/custom_stepper/custom_stepper.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../../bloc/bank_account_bloc.dart';
import '../../../repository/bank_account_repository.dart';
import '../../utils/deposit_utils.dart';
import '../deposit_screen.dart';
import '../widgets/deposit_base_widget.dart';
import 'widgets/deposit_step/domain/deposit_step_model.dart';

part 'widgets/deposit_step/deposit_step.dart';

part 'widgets/deposit_step/utils/deposit_step_utils.dart';

part 'widgets/deposit_welcome_notes.dart';

part 'widgets/deposit_bank_account.dart';

class DepositWelcomeScreen extends StatelessWidget {
  final DepositType? initialDepositType;
  static const String route = '/deposit_welcome_screen';

  final _spaceHeight = const SizedBox(
    height: 54,
  );
  final _spaceHeightSmall = const SizedBox(
    height: 21,
  );

  const DepositWelcomeScreen({
    this.initialDepositType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        BankAccountBloc bankAccountBloc =
            BankAccountBloc(bankAccountRepository: BankAccountRepository());
        if (initialDepositType == null) {
          bankAccountBloc.add(const RegisteredBankAccountCheck());
        }
        return bankAccountBloc;
      },
      child: BlocConsumer<BankAccountBloc, BankAccountState>(
        listener: (context, state) {
          if (state.response.state == ResponseState.loading) {
            CustomLoadingOverlay.show(context);
          } else {
            CustomLoadingOverlay.dismiss();
          }
        },
        builder: (context, state) {
          DepositType depositType = initialDepositType ?? state.depositType;
          return DepositBaseWidget(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DepositStep(
                    depositType: depositType,
                  ),
                  _spaceHeightSmall,
                  GestureDetector(
                    onTap: () async =>
                        await launchUrl(Uri.parse(depositGuideUrl)),
                    child: CustomTextNew(
                      'VIEW DEPOSIT GUIDE',
                      style: AskLoraTextStyles.subtitle2.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  _spaceHeight,
                  DepositBankAccount(
                    depositType: depositType,
                    spaceHeightSmall: _spaceHeightSmall,
                    spaceHeight: _spaceHeight,
                  ),
                  DepositWelcomeNotes(
                    depositType: depositType,
                  ),
                ],
              ),
              bottomButton: _bottomButton(
                context,
                depositType,
              ));
        },
      ),
    );
  }

  Widget _bottomButton(BuildContext context, DepositType depositType) {
    switch (depositType) {
      case DepositType.firstTime:
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ButtonPair(
              primaryButtonOnClick: () => DepositScreen.open(
                    context: context,
                    depositType: depositType,
                  ),
              secondaryButtonOnClick: () => TabsScreen.open(context),
              primaryButtonLabel: 'CONTINUE',
              secondaryButtonLabel: 'MAYBE LATER'),
        );
      default:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: PrimaryButton(
            label: 'CONTINUE',
            onTap: () => DepositScreen.open(
              context: context,
              depositType: depositType,
            ),
          ),
        );
    }
  }

  static void open({required BuildContext context, DepositType? depositType}) =>
      Navigator.pushNamed(context, route, arguments: depositType);
}
