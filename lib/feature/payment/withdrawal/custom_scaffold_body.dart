import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/presentation/custom_text_button.dart';
import 'bloc/withdraw_bloc.dart';

class CustomScaffoldBody extends StatelessWidget {
  final List<Widget> children;
  final WithdrawPages? onTapBack;
  final WithdrawPages? onTapNext;

  const CustomScaffoldBody(
      {required this.children, this.onTapNext, this.onTapBack, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => onTapBack != null
                          ? context
                              .read<WithdrawBloc>()
                              .add(PageChanged(onTapBack!))
                          : Navigator.pop(context),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 52,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32, left: 32, right: 32),
          child: CustomTextButton(
            height: 40,
            buttonText: 'Next',
            onClick: () => onTapNext != null
                ? context.read<WithdrawBloc>().add(PageChanged(onTapNext!))
                : null,
            primaryColor: Colors.black,
            borderRadius: 6,
          ),
        )
      ],
    );
  }
}
