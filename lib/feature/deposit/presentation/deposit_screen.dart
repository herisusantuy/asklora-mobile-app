import '../deposit_edda_your_bank_details/bloc/deposit_edda_your_bank_details_bloc.dart';
import '../deposit_edda_your_bank_details/presentation/deposit_edda_your_bank_details_screen.dart';
import 'wire_transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../payment/withdrawal/withdrawal_acknowledgement/presentation/withdrawal_acknowledgement_screen.dart';
import '../bloc/deposit_bloc.dart';
import '../deposit_edda_new_user/presentation/deposit_edda_new_user_screen.dart';
import '../deposit_upload_proof_of_remittance/bloc/deposit_upload_proof_of_remittance_bloc.dart';
import '../deposit_upload_proof_of_remittance/presentation/deposit_upload_proof_of_remittance_screen.dart';
import '../deposit_upload_proof_of_remittance/repository/FilePickerRepository.dart';
import 'deposit_method_screen.dart';
import 'deposit_welcome_screen.dart';
import 'fps_information_screen.dart';
import 'fps_transfer_screen.dart';

class DepositScreen extends StatelessWidget {
  static const String route = '/deposit_screen';
  final DepositPageStep initialDepositPages;

  const DepositScreen(
      {Key? key, this.initialDepositPages = DepositPageStep.welcome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DepositBloc()),
          BlocProvider(
              create: (_) => DepositUploadProofOfRemittanceBloc(
                  filePickerRepository: FilePickerRepository())),
          BlocProvider(create: (_) => DepositEddaYourBankDetailsBloc()),
        ],
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<DepositBloc, DepositState>(
            builder: (context, state) {
              return _pages(state.depositPages == DepositPageStep.unknown
                  ? initialDepositPages
                  : state.depositPages);
            },
          ),
        ));
  }

  Widget _pages(DepositPageStep step) {
    switch (step) {
      case DepositPageStep.welcome:
        return const DepositWelcomeScreen();
      case DepositPageStep.depositMethod:
        return const DepositMethodScreen();
      case DepositPageStep.fpsMeaning:
        return const FpsInformationScreen();
      case DepositPageStep.fpsTransfer:
        return const FpsTransferScreen();
      case DepositPageStep.uploadProof:
        return const DepositUploadProofOfRemittanceScreen();
      case DepositPageStep.wireTransfer:
        return const WireTransferScreen();
      case DepositPageStep.acknowledged:
        return const WithdrawalAcknowledgementScreen();
      case DepositPageStep.eddaNewUser:
        return const DepositEddaNewUserScreen();
      case DepositPageStep.eddaYourBankDetails:
        return const DepositEddaYourBankDetailsScreen();
      case DepositPageStep.eddaGetBankDetailsLoading:
        return const DepositEddaGetBankDetailsLoadingScreen();
      case DepositPageStep.eddaGetBankDetailsSuccess:
        return const DepositEddaGetBankDetailsSuccessScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
