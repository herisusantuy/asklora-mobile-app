import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_information.dart';
import '../../../bloc/bank_account_bloc.dart';
import '../../bloc/deposit_bloc.dart';
import '../../bloc/navigation_bloc/navigation_bloc.dart';
import '../../../domain/get_bank_account_response.dart';
import '../widget/custom_deposit_widget.dart';

class ReturningUserScreen extends StatelessWidget {
  const ReturningUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
      title: _getTitle(context),
      child: ListView(
        children: [
          _text('Select Bank Account'),
          _text('Deposit From', bottomPadding: 6),
          Column(
            children: _registeredBankAccount(context),
          ),
          Center(child: _text('Or')),
          _text('Add a New Bank Account',
              bottomPadding: 4, fontType: FontType.smallTextBold),
          Center(
              child: InkWell(
            key: const Key('deposit_add_bank_account'),
            onTap: () => context
                .read<NavigationBloc<DepositPageStep>>()
                .add(const PageChanged(DepositPageStep.selectBank)),
            child: const Icon(
              Icons.add_circle_outline,
              size: 50,
            ),
          ))
        ],
      ),
    );
  }

  List<Widget> _registeredBankAccount(BuildContext context) {
    BankAccountState bankAccountState = context.read<BankAccountBloc>().state;
    DepositState depositState = context.read<DepositBloc>().state;
    List<GetBankAccountResponse> bankDetailList = [];
    if (bankAccountState.response.data != null) {
      if (depositState.depositMethod == DepositMethod.wire) {
        bankDetailList = bankAccountState.response.data!.wireBankAccounts!;
      } else if (depositState.depositMethod == DepositMethod.fps) {
        bankDetailList = bankAccountState.response.data!.fpsBankAccounts!;
      } else {
        bankDetailList = bankAccountState.response.data!.eDdaBankAccounts!;
      }
    }

    return bankDetailList
        .map(
          (item) => InkWell(
            onTap: () {
              var depositMethod =
                  context.read<DepositBloc>().state.depositMethod;
              DepositPageStep depositPageStep;
              if (depositMethod == DepositMethod.wire) {
                depositPageStep = DepositPageStep.wireTransfer;
              } else if (depositMethod == DepositMethod.fps) {
                depositPageStep = DepositPageStep.fpsTransfer;
              } else {
                depositPageStep = DepositPageStep.eDdaDepositAmount;
              }
              context
                  .read<NavigationBloc<DepositPageStep>>()
                  .add(PageChanged(depositPageStep));
            },
            child: CustomTextInformation(
              label: _getBankDetails(item),
            ),
          ),
        )
        .toList();
  }

  String _getTitle(BuildContext context) {
    return '${context.read<DepositBloc>().state.depositMethod?.name} Transfer';
  }

  String _getBankDetails(GetBankAccountResponse bankDetail) {
    return '${bankDetail.name}  ${bankDetail.bankCode}';
  }

  Widget _text(String text,
          {FontType fontType = FontType.smallTextBold,
          double bottomPadding = 32}) =>
      CustomText(
        text,
        padding: EdgeInsets.only(top: 10, bottom: bottomPadding),
        type: fontType,
      );
}
