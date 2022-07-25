import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/withdrawal_bloc.dart';

class CustomWithdrawalWidget extends StatelessWidget {
  final List<Widget> children;
  final WithdrawalPages? backTo;
  final Widget? navigationButton;
  final bool disableButton;
  final Function? onSubmit;

  const CustomWithdrawalWidget(
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
}
