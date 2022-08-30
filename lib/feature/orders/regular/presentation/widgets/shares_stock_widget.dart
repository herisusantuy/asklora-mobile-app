import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class SharesStockWidget extends StatelessWidget {
  const SharesStockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomText(
            '1.12',
            type: FontType.highlight,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                  onTap: () => {}, child: Icon(Icons.add_circle_outline)),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: InkWell(
                  onTap: () => {},
                  child: Icon(Icons.remove_circle_outline_outlined)),
            ),
          ],
        )
      ],
    );
  }
}
