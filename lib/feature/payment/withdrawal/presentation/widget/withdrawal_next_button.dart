import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../bloc/withdrawal_bloc.dart';

class WithdrawalNextButton extends StatelessWidget {
  final bool disable;
  final WithdrawalPages nextTo;

  const WithdrawalNextButton(
      {required this.nextTo, this.disable = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: CustomTextButton(
        height: 40,
        disable: disable,
        buttonText: 'Next',
        onClick: () => context.read<WithdrawalBloc>().add(PageChanged(nextTo)),
        primaryColor: Colors.black,
        borderRadius: 6,
      ),
    );
  }
}
