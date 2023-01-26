import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_image_picker.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_status_widget.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../../core/presentation/text_fields/amount_text_field.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../onboarding/kyc/presentation/widgets/custom_stepper/custom_stepper.dart';
import '../bloc/deposit_bloc.dart';
import '../repository/deposit_repository.dart';
import '../utils/deposit_utils.dart';
import 'deposit_result_screen.dart';
import 'widgets/deposit_base_widget.dart';

part 'widgets/deposit_notes.dart';

part 'widgets/deposit_step/deposit_base_step.dart';

part 'widgets/deposit_step/upload_proof_of_remittance_step.dart';

part 'widgets/deposit_step/transfer_amount_step.dart';

part 'widgets/deposit_step/transfer_detail_step.dart';

class DepositScreen extends StatelessWidget {
  static const String route = '/deposit_screen';
  final DepositType depositType;

  const DepositScreen({required this.depositType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DepositBloc(depositRepository: DepositRepository()),
      child: BlocListener<DepositBloc, DepositState>(
        listenWhen: (previous, current) =>
            previous.response.state != current.response.state,
        listener: (context, state) {
          if (state.response.state == ResponseState.loading) {
            CustomLoadingOverlay.show(context);
          } else if (state.response.state == ResponseState.error) {
            ///LETS ASSUME ERROR AS SUCCEED FOR NOW TO SHOW THE RESULT SCREEN
            CustomLoadingOverlay.dismiss();
            // CustomInAppNotification.show(context, state.response.message);
            DepositResultScreen.open(
                context: context,
                arguments: Pair(depositType, StatusType.success));
          } else if (state.response.state == ResponseState.success) {
            CustomLoadingOverlay.dismiss();
            DepositResultScreen.open(
                context: context,
                arguments: Pair(depositType, StatusType.success));
          }
        },
        child: DepositBaseWidget(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._getSteps,
                DepositNotes(
                  depositType: depositType,
                )
              ],
            ),
            bottomButton: _bottomButton(context)),
      ),
    );
  }

  List<Widget> get _getSteps {
    switch (depositType) {
      case DepositType.firstTime:
        return [
          const TransferDetailStep(),
          const TransferAmountStep(),
          const UploadProofOfRemittanceStep(),
        ];
      case DepositType.type1:
        return [
          const TransferDetailStep(),
          const TransferAmountStep(),
          const UploadProofOfRemittanceStep(),
        ];
      case DepositType.type2:
        return [
          const TransferDetailStep(),
          const TransferAmountStep(
            drawLine: false,
          ),
        ];
    }
  }

  Widget _bottomButton(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 30.0, top: 30),
        child: BlocBuilder<DepositBloc, DepositState>(
            buildWhen: (previous, current) =>
                previous.disableDeposit(depositType) !=
                current.disableDeposit(depositType),
            builder: (context, state) => PrimaryButton(
                  disabled: state.disableDeposit(depositType),
                  label: 'CONTINUE',
                  onTap: () => context.read<DepositBloc>().add(
                        SubmitDeposit(),
                      ),
                )),
      );

  static void open(
          {required BuildContext context, required DepositType depositType}) =>
      Navigator.pushNamed(context, route, arguments: depositType);
}
