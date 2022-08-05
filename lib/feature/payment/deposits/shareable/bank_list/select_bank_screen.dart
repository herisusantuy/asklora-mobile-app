import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/clearable_text_field.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/utils/formatters/bank_code_formatter.dart';
import '../../bloc/deposit_bloc.dart';
import '../widget/custom_deposit_widget.dart';
import 'bloc/select_bank_bloc.dart';
import 'domain/bank_details.dart';

class SelectBankScreen extends StatelessWidget {
  final DepositPageStep _backStep;

  const SelectBankScreen(this._backStep, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
        title: 'Please Select a Bank',
        backTo: _backStep, //DepositPageStep.eddaInitiate,
        children: [
          ClearableTextFormField(
            key: const Key('deposit_search_bank_input'),
            labelText: 'Search Bank',
            hintText: 'Search by Name or Bank Code',
            onChanged: (value) =>
                context.read<SelectBankBloc>().add(SearchBank(value)),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: _listBanks(),
          )),
        ]);
  }

  Widget _listBanks() {
    return BlocBuilder<SelectBankBloc, SelectBankState>(
      builder: (context, state) {
        return Column(
            children: (state.response.data as List<BankDetails>)
                .map((item) => _banksCard(context, item))
                .toList());
      },
    );
  }

  Widget _banksCard(BuildContext context, BankDetails bankDetails) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => context.read<DepositBloc>().add(BankSelected(bankDetails)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: CustomText(bankCodeFormatter(bankDetails.clearingCode))),
            Expanded(flex: 10, child: CustomText(bankDetails.bankName)),
          ],
        ),
      ),
    );
  }
}
