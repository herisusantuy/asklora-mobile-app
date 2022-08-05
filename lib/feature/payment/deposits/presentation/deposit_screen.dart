import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../withdrawal/presentation/acknowledgement_screen.dart';
import '../bloc/deposit_bloc.dart';
import '../edda/bloc/amount/amount_bloc.dart';
import '../edda/presentation/amount_screen.dart';
import '../edda/presentation/initiate_screen.dart';
import '../fps/presentation/information_screen.dart';
import '../fps/presentation/transfer_screen.dart';
import '../repository/bank_details_repository.dart';
import '../repository/file_picker_repository.dart';
import '../shareable/bank_details/bank_details_screen.dart';
import '../shareable/bank_details/bloc/bank_details_bloc.dart';
import '../shareable/bank_list/bloc/select_bank_bloc.dart';
import '../shareable/bank_list/select_bank_screen.dart';
import '../shareable/proof_of_remittance/bloc/upload_proof_of_remittance_bloc.dart';
import '../shareable/proof_of_remittance/upload_proof_of_remittance_screen.dart';
import '../wire/presentation/wire_transfer_screen.dart';
import 'deposit_method_screen.dart';
import 'deposit_welcome_screen.dart';

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
            create: (_) =>
                SelectBankBloc(bankDetailsRepository: BankDetailsRepository())
                  ..add(GetListBanks())),
        BlocProvider(
            create: (_) => UploadProofOfRemittanceBloc(
                filePickerRepository: FilePickerRepository())),
        BlocProvider(create: (_) => BankDetailsBloc()),
        BlocProvider(create: (_) => AmountBloc()),
      ],
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<DepositBloc, DepositState>(
            builder: (context, state) => _pages(state),
          )),
    );
  }

  Widget _pages(DepositState state) {
    switch (state.depositPages == DepositPageStep.unknown
        ? initialDepositPages
        : state.depositPages) {
      case DepositPageStep.welcome:
        return const DepositWelcomeScreen();
      case DepositPageStep.depositMethod:
        return const DepositMethodScreen();
      case DepositPageStep.fpsMeaning:
        return const InformationScreen();
      case DepositPageStep.selectBank:
        return SelectBankScreen(_backStep(state.depositMethod));
      case DepositPageStep.fpsTransfer:
        return const TransferScreen();
      case DepositPageStep.uploadProof:
        return const UploadProofOfRemittanceScreen();
      case DepositPageStep.wireTransfer:
        return const WireTransferScreen();
      case DepositPageStep.acknowledged:
        return const AcknowledgementScreen();
      case DepositPageStep.eddaInitiate:
        return const InitiateScreen();
      case DepositPageStep.eDdaBankDetails:
        return BankDetailsScreen(state.bankDetails);
      case DepositPageStep.eDdaBankDetailsProgress:
        return const BankDetailsProgressScreen();
      case DepositPageStep.eDdaBankDetailsSuccess:
        return const BankDetailsSuccessScreen();
      case DepositPageStep.eDdaDepositAmount:
        return const AmountScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  DepositPageStep _backStep(DepositMethod? depositMethod) {
    switch (depositMethod) {
      case DepositMethod.eDda:
        return DepositPageStep.eddaInitiate;
      case DepositMethod.fps:
      case DepositMethod.wireTransfer:
      default:
        return DepositPageStep.depositMethod;
    }
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
