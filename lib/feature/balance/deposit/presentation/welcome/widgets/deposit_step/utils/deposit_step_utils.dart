part of '../../../deposit_welcome_screen.dart';

final List<DepositStepModel> _firstTimeStep = [
  DepositStepModel(
      title: 'Deposit via FPS or Wire Transfer',
      subTitle:
          "Transfer at least HK\$${DepositType.firstTime.minDepositString} to Asklora's bank account. ",
      subTitleColor: AskLoraColors.primaryMagenta),
  DepositStepModel(
    title: 'Input deposit amount',
    subTitle: 'The amount must match with the proof of remittance.',
  ),
  DepositStepModel(
    title: 'Upload proof of remittance',
    subTitle:
        'The proof of remittance should show your bank account number, full name, and amount.',
  ),
  DepositStepModel(
    title: 'Deposit via FPS or Wire Transfer',
    subTitle:
        "Transfer at least HK\$${DepositType.firstTime.minDepositString} to Asklora's bank account. ",
  ),
];

final List<DepositStepModel> _type1Step = [
  DepositStepModel(
      title: 'Deposit via FPS or Wire Transfer',
      subTitle:
          'Transfer ${DepositType.type1.minDeposit != 0 ? 'at least HK\$${DepositType.type1.minDepositString}' : ''} to Asklora’s bank account from the same bank account you used. ',
      subTitleColor: AskLoraColors.primaryMagenta),
  DepositStepModel(
    title: 'Input deposit amount',
    subTitle: 'The amount must match with the proof of remittance.',
  ),
  DepositStepModel(
    title: 'Your deposit can take up to 2 working days.',
  ),
];

final List<DepositStepModel> _type2Step = [
  DepositStepModel(
      title: 'Deposit via FPS or Wire Transfer',
      subTitle:
          'Transfer ${DepositType.type1.minDeposit != 0 ? 'at least HK\$${DepositType.type1.minDepositString}' : ''} to Asklora’s bank account from the same bank account you used. ',
      subTitleColor: AskLoraColors.primaryMagenta),
  DepositStepModel(
    title: 'Upload proof of remittance',
    subTitle:
        'The proof of remittance should show your bank account number, full name, and amount.',
  ),
  DepositStepModel(
    title: 'Your deposit can take up to 2 working days.',
  ),
];
