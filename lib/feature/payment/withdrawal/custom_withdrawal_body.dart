import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/presentation/custom_text_button.dart';
import 'bloc/withdrawal_bloc.dart';

class CustomWithdrawalBody extends StatelessWidget {
  final List<Widget> children;
  final WithdrawalPages? backTo;
  final Widget? navigationButton;
  final bool disableButton;
  final Function? onSubmit;

  const CustomWithdrawalBody(
      {required this.children,
      this.backTo,
      this.onSubmit,
      this.disableButton = true,
      this.navigationButton,
      Key? key})
      : super(key: key);

  void _onTapBack(BuildContext context) => backTo != null
      ? context.read<WithdrawalBloc>().add(PageChanged(backTo!))
      : Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onTapBack(context);
        return false;
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () => _onTapBack(context),
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
          navigationButton ?? const SizedBox.shrink()
        ],
      ),
    );
  }

  static Widget nextButton(
          {required BuildContext context,
          required WithdrawalPages nextTo,
          bool disableButton = true}) =>
      Padding(
        padding: const EdgeInsets.all(32),
        child: CustomTextButton(
          height: 40,
          disable: disableButton,
          buttonText: 'Next',
          onClick: () =>
              context.read<WithdrawalBloc>().add(PageChanged(nextTo)),
          primaryColor: Colors.black,
          borderRadius: 6,
        ),
      );

  static Widget submitButton(
          {required BuildContext context,
          required Function onSubmit,
          bool disableButton = true}) =>
      Padding(
        padding: const EdgeInsets.all(32),
        child: CustomTextButton(
          height: 40,
          disable: disableButton,
          buttonText: 'Submit',
          onClick: onSubmit,
          primaryColor: Colors.black,
          borderRadius: 6,
        ),
      );
}
