import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_button.dart';
import '../../widgets/symbol_details_widget.dart';

class RegularOrderSymbolDetailsScreen extends StatelessWidget {
  const RegularOrderSymbolDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            const SymbolDetailsWidget(),
            Expanded(
              //TODO: Add others widgets like graph and financials here.
              child: Container(),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextButton(buttonText: 'BUY', onClick: () => {}),
                      ],
                    )),
                const SizedBox(width: 10),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextButton(buttonText: 'SELL', onClick: () => {}),
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
