import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../presentation/custom_payment_text_information_widget.dart';
import '../../bloc/deposit_bloc.dart';
import '../bank_details/domain/get_bank_account_response.dart';
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
          Column(
            children: _registeredBankAccount(context.read<DepositBloc>().state),
          ),
          Center(child: _text('Or')),
          _text('Add a New Bank Account',
              bottomPadding: 4, fontType: FontType.smallTextBold),
          Center(
              child: InkWell(
            key: const Key('deposit_add_bank_account'),
            onTap: () => context
                .read<DepositBloc>()
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

  List<Widget> _registeredBankAccount(DepositState depositState) {
    List<GetBankAccountResponse> bankDetailList;
    if (depositState.depositMethod == DepositMethod.wire) {
      bankDetailList =
          depositState.registeredBankAccountResponse!.data!.wireBankAccount!;
    } else if (depositState.depositMethod == DepositMethod.fps) {
      bankDetailList =
          depositState.registeredBankAccountResponse!.data!.fpsBankAccount!;
    } else {
      bankDetailList =
          depositState.registeredBankAccountResponse!.data!.eDdaBankAccount!;
    }
    return bankDetailList
        .map(
          (item) => CustomPaymentTextInformationWidget(
            label: _getBankDetails(item),
            title: 'Deposit From',
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
