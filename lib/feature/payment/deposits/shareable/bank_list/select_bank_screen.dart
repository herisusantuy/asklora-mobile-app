import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/clearable_text_field.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/utils/formatters/bank_code_formatter.dart';
import '../../bloc/deposit_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import 'bloc/select_bank_bloc.dart';
import 'domain/bank_details.dart';

class SelectBankScreen extends StatelessWidget {
  const SelectBankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepositBloc, DepositState>(
      listenWhen: (_, current) => current.depositEvent is BankSelected,
      listener: (context, state) {
        context
            .read<NavigationBloc<DepositPageStep>>()
            .add(const PageChanged(DepositPageStep.eDdaBankDetails));
      },
      child: CustomNavigationWidget<DepositPageStep>(
          title: 'Please Select a Bank',
          child: Column(children: [
            ClearableTextFormField(
              key: const Key('deposit_search_bank_input'),
              labelText: 'Search Bank',
              hintText: 'Search by Name or Bank Code',
              onChanged: (value) =>
                  context.read<SelectBankBloc>().add(SearchBank(value)),
            ),
            Flexible(child: _listBanks()),
          ])),
    );
  }

  Widget _listBanks() {
    return BlocBuilder<SelectBankBloc, SelectBankState>(
      builder: (context, state) {
        var data = state.response.data as List<BankDetails>;
        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return _banksCard(context, data[index]);
            });
      },
    );
  }

  Widget _banksCard(BuildContext context, BankDetails bankDetails) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => context.read<DepositBloc>().add(
          BankSelected(bankDetails, DateTime.now().millisecondsSinceEpoch)),
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
