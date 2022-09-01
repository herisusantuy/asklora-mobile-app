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
            InkWell(
                onTap: () => {}, child: const Icon(Icons.add_circle_outline)),
            const SizedBox(height: 10),
            InkWell(
                onTap: () => {},
                child: const Icon(Icons.remove_circle_outline_outlined)),
          ],
        )
      ],
    );
  }
}
