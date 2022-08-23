import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../withdrawal/presentation/acknowledgement_screen.dart';
import '../bloc/deposit_bloc.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../edda/bloc/amount/amount_bloc.dart';
import '../edda/presentation/edda_acknowledgement_screen.dart';
import '../edda/presentation/edda_amount_deposit_screen.dart';
import '../edda/presentation/edda_information_screen.dart';
import '../edda/presentation/finished_screen.dart';
import '../edda/presentation/initiate_screen.dart';
import '../fps/presentation/fps_information_screen.dart';
import '../fps/presentation/fps_transfer_screen.dart';
import '../repository/bank_details_repository.dart';
import '../repository/file_picker_repository.dart';
import '../shareable/bank_details/bank_account_details_screen.dart';
import '../shareable/bank_details/bloc/bank_details_bloc.dart';
import '../shareable/bank_details/edda_bank_account_details_screen.dart';
import '../shareable/bank_list/bloc/select_bank_bloc.dart';
import '../shareable/bank_list/select_bank_screen.dart';
import '../shareable/proof_of_remittance/bloc/upload_proof_of_remittance_bloc.dart';
import '../shareable/proof_of_remittance/upload_proof_of_remittance_screen.dart';
import '../shareable/returning_user/returning_user_screen.dart';
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
        BlocProvider(create: (_) => NavigationBloc(initialDepositPages)),
        BlocProvider(
            create: (_) =>
                DepositBloc(bankDetailsRepository: BankDetailsRepository())),
        BlocProvider(
            create: (_) =>
                SelectBankBloc(bankDetailsRepository: BankDetailsRepository())
                  ..add(GetListBanks())),
        BlocProvider(
            create: (_) => UploadProofOfRemittanceBloc(
                filePickerRepository: FilePickerRepository())),
        BlocProvider(
            create: (_) => BankDetailsBloc(
                bankDetailsRepository: BankDetailsRepository())),
        BlocProvider(create: (_) => AmountBloc()),
      ],
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: BlocConsumer<NavigationBloc<DepositPageStep>,
              NavigationState<DepositPageStep>>(
            listenWhen: (_, current) => current.lastPage == true,
            listener: (context, state) {
              Navigator.pop(context);
            },
            builder: (context, state) =>
                _pages(state, context.read<DepositBloc>().state),
          )),
    );
  }

  Widget _pages(NavigationState navigationState, DepositState depositState) {
    switch (navigationState.page == DepositPageStep.unknown
        ? initialDepositPages
        : navigationState.page) {
      case DepositPageStep.welcome:
        return const DepositWelcomeScreen();
      case DepositPageStep.depositMethod:
        return const DepositMethodScreen();
      case DepositPageStep.fpsMeaning:
        return const FpsInformationScreen();
      case DepositPageStep.selectBank:
        return const SelectBankScreen();
      case DepositPageStep.fpsTransfer:
        return const FpsTransferScreen();
      case DepositPageStep.uploadProof:
        return const UploadProofOfRemittanceScreen();
      case DepositPageStep.wireTransfer:
        return const WireTransferScreen();
      case DepositPageStep.acknowledged:
        return const AcknowledgementScreen();
      case DepositPageStep.eDdaMeaning:
        return const EddaInformationScreen();
      case DepositPageStep.eDdaInitiate:
        return const InitiateScreen();
      case DepositPageStep.eDdaBankDetails:
        if (depositState.depositMethod == DepositMethod.eDda) {
          return EddaBankAccountDetailsScreen(depositState.bankDetails);
        } else {
          return BankAccountDetailsScreen(depositState.bankDetails);
        }
      case DepositPageStep.eDdaBankDetailsProgress:
        return const BankDetailsProgressScreen();
      case DepositPageStep.eDdaBankDetailsSuccess:
        return const BankDetailsSuccessScreen();
      case DepositPageStep.eDdaDepositAmount:
        return const EddaAmountDepositScreen();
      case DepositPageStep.eDdaAcknowledged:
        return const EddaAcknowledgementScreen();
      case DepositPageStep.eDdaFinished:
        return const FinishedScreen();
      case DepositPageStep.returningUser:
        return const ReturningUserScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
