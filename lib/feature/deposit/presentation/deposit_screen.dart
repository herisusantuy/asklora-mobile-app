import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/deposit_bloc.dart';
import '../deposit_upload_proof_of_remittance/bloc/deposit_upload_proof_of_remittance_bloc.dart';
import '../deposit_upload_proof_of_remittance/presentation/deposit_upload_proof_of_remittance_screen.dart';
import '../deposit_upload_proof_of_remittance/repository/FilePickerRepository.dart';
import 'deposit_method_screen.dart';
import 'deposit_welcome_screen.dart';
import 'fps_information_screen.dart';
import 'fps_transfer_screen.dart';

class DepositScreen extends StatelessWidget {
  static const String route = '/deposit_screen';
  final DepositPages initialDepositPages;

  const DepositScreen(
      {Key? key, this.initialDepositPages = DepositPages.welcome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DepositBloc()),
          BlocProvider(
              create: (_) => DepositUploadProofOfRemittanceBloc(
                  filePickerRepository: FilePickerRepository())),
        ],
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<DepositBloc, DepositState>(
            builder: (context, state) {
              return _pages(state.depositPages == DepositPages.unknown
                  ? initialDepositPages
                  : state.depositPages);
            },
          ),
        ));
  }

  Widget _pages(DepositPages pages) {
    switch (pages) {
      case DepositPages.welcome:
        return const DepositWelcomeScreen();
      case DepositPages.depositMethod:
        return const DepositMethodScreen();
      case DepositPages.fpsMeaning:
        return const FpsInformationScreen();
      case DepositPages.fpsTransfer:
        return const FpsTransferScreen();
      case DepositPages.uploadProof:
        return const DepositUploadProofOfRemittanceScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
