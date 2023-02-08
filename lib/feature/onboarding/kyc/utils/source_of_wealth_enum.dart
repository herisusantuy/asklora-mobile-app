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

  SourceOfWealthModel({
    required this.sourceOfWealthType,
    this.amount = 0,
    this.additionalSourceOfWealth,
  });

  SourceOfWealthModel copyWith({
    SourceOfWealthType? sourceOfWealthType,
    int? amount,
    String? additionalSourceOfWealth,
  }) {
    return SourceOfWealthModel(
      sourceOfWealthType: sourceOfWealthType ?? this.sourceOfWealthType,
      amount: amount ?? this.amount,
      additionalSourceOfWealth:
          additionalSourceOfWealth ?? this.additionalSourceOfWealth,
    );
  }
}
