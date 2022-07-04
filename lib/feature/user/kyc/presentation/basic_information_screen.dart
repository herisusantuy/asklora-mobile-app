import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text_input.dart';
import '../../upgrade_account/bloc/upgrade_account_bloc.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpgradeAccountBloc, UpgradeAccountState>(
      listener: (state, context) async {},
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _firstNameInput(),
            _padding(),
            _middleNameInput(),
          ],
        ),
      ),
    );
  }

  Widget _firstNameInput() {
    return BlocBuilder<UpgradeAccountBloc, UpgradeAccountState>(
        builder: (context, state) {
      return CustomTextInput(
        labelText: 'First Name',
        onChanged: (firstName) => context
            .read<UpgradeAccountBloc>()
            .add(UpgradeAccountFirstNameChanged(firstName)),
        hintText: 'Input First Name',
      );
    });
  }

  Widget _middleNameInput() {
    return BlocBuilder<UpgradeAccountBloc, UpgradeAccountState>(
        builder: (context, state) {
      return CustomTextInput(
        labelText: 'Middle Name',
        onChanged: (middleName) => context
            .read<UpgradeAccountBloc>()
            .add(UpgradeAccountMiddleNameChanged(middleName)),
        hintText: 'Input Middle Name',
      );
    });
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
