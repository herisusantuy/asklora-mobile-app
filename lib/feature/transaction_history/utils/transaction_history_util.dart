import 'dart:ui';

import '../../../core/styles/asklora_colors.dart';

enum TransferType {
  deposit('DEPOSIT', 'Deposit'),
  withdraw('WITHDRAW', 'Withdrawal');

  final String value;
  final String title;

  static TransferType findByString(String transferTypeString) {
    TransferType transferType = TransferType.values
        .firstWhere((element) => element.value == transferTypeString);
    return transferType;
  }

  const TransferType(this.value, this.title);
}

enum TransferStatus {
  pending('pending', 'Pending', AskLoraColors.primaryMagenta),
  active('success', 'Completed', AskLoraColors.primaryGreen);

  final String value;
  final String name;
  final Color color;

  static TransferStatus findByString(String transferStatusString) {
    TransferStatus transferStatus = TransferStatus.values
        .firstWhere((element) => element.value == transferStatusString);
    return transferStatus;
  }

  const TransferStatus(this.value, this.name, this.color);
}
