import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../bloc/deposit_bloc.dart';

class DepositNextButton extends StatelessWidget {
  final bool disable;
  final DepositPages nextTo;

  const DepositNextButton({required this.nextTo, this.disable = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: CustomTextButton(
        disable: disable,
        buttonText: 'Next',
        onClick: () {
          context.read<DepositBloc>().add(PageChanged(nextTo));
        },
        borderRadius: 5,
      ),
    );
  }
}
