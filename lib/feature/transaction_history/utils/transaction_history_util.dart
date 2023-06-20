import 'dart:ui';

import '../../../core/styles/asklora_colors.dart';

enum TransferType {
  deposit('DEPOSIT', 'Deposit', AskLoraColors.primaryGreen, '+'),
  withdraw('WITHDRAW', 'Withdrawal', AskLoraColors.primaryMagenta, '-');

  final String value;
  final String title;
  final Color color;
  final String punctuation;

  static TransferType findByString(String transferTypeString) {
    TransferType transferType = TransferType.values
        .firstWhere((element) => element.value == transferTypeString);
    return transferType;
  }

  const TransferType(this.value, this.title, this.color, this.punctuation);
}

enum TransferStatus {
  pending('pending', 'Pending', AskLoraColors.primaryMagenta),
  active('success', 'Completed', AskLoraColors.primaryGreen),
  rejected('rejected', 'Rejected', AskLoraColors.primaryMagenta);

  final String value;
  final String name;
  final Color color;

  static TransferStatus find(String transferStatusString,
      {String? timeRejected, bool? isRefunded}) {
    if (timeRejected != null &&
        timeRejected.isNotEmpty &&
        isRefunded != null &&
        isRefunded == true) {
      return TransferStatus.rejected;
    } else {
      return TransferStatus.values
          .firstWhere((element) => element.value == transferStatusString);
    }
  }

  const TransferStatus(this.value, this.name, this.color);
}

int compareDateTimeDesc(DateTime? a, DateTime? b) {
  if (a != null && b != null) {
    return b.compareTo(a);
  } else {
    return 1;
  }
}
