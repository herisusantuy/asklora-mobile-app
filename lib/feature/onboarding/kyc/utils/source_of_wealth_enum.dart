import 'package:equatable/equatable.dart';

enum SourceOfWealthType {
  incomeFromEmployment('Income from Employment'),
  inheritance('Inheritance/Gift'),
  interestOrDividendIncome('Interest / Dividend Income'),
  marketTradingProfits('Market Trading Profits'),
  disability('Disability / Severance / Unemployment'),
  pension('Pension / Government Retirement benefit'),
  property('Property'),
  allowanceOrSpousalIncome('Allowance / Spousal Income'),
  other('Other');

  final String value;

  const SourceOfWealthType(this.value);
}

class SourceOfWealthModel {
  final SourceOfWealthType sourceOfWealthType;
  final int amount;
  final String? additionalSourceOfWealth;
  final bool isActive;

  const SourceOfWealthModel({
    required this.sourceOfWealthType,
    this.amount = 0,
    this.additionalSourceOfWealth,
    this.isActive = false,
  });

  SourceOfWealthModel copyWith({
    SourceOfWealthType? sourceOfWealthType,
    int? amount,
    String? additionalSourceOfWealth,
    bool? isActive,
  }) {
    return SourceOfWealthModel(
      sourceOfWealthType: sourceOfWealthType ?? this.sourceOfWealthType,
      amount: amount ?? this.amount,
      additionalSourceOfWealth:
          additionalSourceOfWealth ?? this.additionalSourceOfWealth,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  String toString() {
    return [
      sourceOfWealthType.name,
      amount,
      additionalSourceOfWealth,
      isActive,
    ].toString();
  }
}
