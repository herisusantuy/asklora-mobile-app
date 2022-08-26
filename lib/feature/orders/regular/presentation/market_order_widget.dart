import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../bloc/order_bloc.dart';
import '../../domain/symbol_detail.dart';

class MarketOrderWidget extends StatelessWidget {
  final SymbolDetail symbolDetail;
  final TransactionType transactionType;

  const MarketOrderWidget(this.transactionType, this.symbolDetail, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size.fromHeight(40)),
                  child: const Text('Amount'),
                )),
            const SizedBox(width: 20),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size.fromHeight(40)),
                  child: const Text('Shares'),
                ))
          ],
        ),
        _spaceHeight,
        const CustomText(r'$80.00', type: FontType.h3),
        _spaceHeight,
        CustomExpandedRow('Market price of ${symbolDetail.name}',
            text: symbolDetail.marketPrice, fontType: FontType.smallText),
        const CustomExpandedRow('Number of shares',
            text: r'0.8', fontType: FontType.smallText),
        const CustomExpandedRow('Estimate Total',
            text: r'$80', fontType: FontType.smallText),
        _spaceHeight,
        _spaceHeight,
        if (transactionType == TransactionType.buy) ...[
          const CustomExpandedRow('Available buying power',
              text: r'$1000.00', fontType: FontType.smallText),
          const CustomExpandedRow('Number of shares you can buy',
              text: '10.00', fontType: FontType.smallText),
        ] else if (transactionType == TransactionType.sell) ...[
          const CustomExpandedRow('Available amount to sell',
              text: r'$1000.00', fontType: FontType.smallText),
          const CustomExpandedRow('Number of shares you can sell',
              text: '10.00', fontType: FontType.smallText),
        ],
      ],
    );
  }

  Widget get _spaceHeight => const SizedBox(height: 15);
}
