enum DepositType {
  firstTime(minDeposit: 10000),
  type1(minDeposit: 0),
  type2(minDeposit: 0);

  final double minDeposit;

  const DepositType({required this.minDeposit});
}

const int maximumProofOfRemittanceImagesAllowed = 3;
