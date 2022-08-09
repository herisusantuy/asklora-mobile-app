import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/deposit_bloc.dart';

class CustomDepositWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final DepositPageStep? backTo;
  final Widget? navigationButton;
  final bool disableButton;
  final Function? onSubmit;
  final Function? onBackPressed;

  const CustomDepositWidget(
      {required this.child,
      this.backTo,
      this.onSubmit,
      this.disableButton = true,
      this.navigationButton,
      this.title = '',
      this.onBackPressed,
      Key? key})
      : super(key: key);

  void _onTapBack(BuildContext context) {
    backTo != null
        ? context.read<DepositBloc>().add(PageChanged(backTo!))
        : Navigator.pop(context);
    if (onBackPressed != null) {
      onBackPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onTapBack(context);
        return false;
      },
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.blue,
              child: Row(
                children: [
                  InkWell(
                      onTap: () => _onTapBack(context),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.chevron_left,
                          size: 40,
                          color: Colors.white,
                        ),
                      )),
                  if (title.isNotEmpty)
                    CustomText(
                      title,
                      type: FontType.h5,
                      color: Colors.white,
                    )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Container(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  child: child,
                ),
              ),
            ),
            navigationButton ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
