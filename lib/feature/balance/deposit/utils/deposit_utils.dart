enum DepositType {
  firstTime(minDeposit: 10000),
  type1(minDeposit: 3000),
  type2(minDeposit: 3000);

  final double minDeposit;

  const DepositType({required this.minDeposit});
}

const int maximumProofOfRemittanceImagesAllowed = 3;
