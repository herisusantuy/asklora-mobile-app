import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_input.dart';
import '../../../../core/utils/formatters/bank_code_formatter.dart';
import '../bloc/deposit_bloc.dart';
import '../bloc/list_bank/select_bank_bloc.dart';
import 'widget/custom_deposit_widget.dart';

class SelectBankScreen extends StatelessWidget {
  const SelectBankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
        title: 'Please Select a Bank',
        backTo: DepositPageStep.depositMethod,
        children: [
          CustomTextInput(
            key: const Key('deposit_search_bank_input'),
            labelText: 'Search Bank',
            hintText: 'Search by Name or Bank Code',
            onChanged: (value) =>
                context.read<SelectBankBloc>().add(SearchBank(value)),
          ),
          _listBanks()
        ]);
  }

  Widget _listBanks() {
    return BlocBuilder<SelectBankBloc, SelectBankState>(
      builder: (context, state) {
        return Column(
          children: state.listBanks
              .map((item) => _banksCard(
                    item.clearingCode,
                    item.bankName,
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _banksCard(int bankCode, String bankName) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => '',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: CustomText(bankCodeFormatter(bankCode))),
            Expanded(flex: 10, child: CustomText(bankName)),
          ],
        ),
      ),
    );
  }
}
