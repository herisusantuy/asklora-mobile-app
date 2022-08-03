part of 'deposit_edda_your_bank_details_bloc.dart';

enum CompleteStep { firstStep, secondStep }

class DepositEddaYourBankDetailsState extends Equatable {
  final String bankAccountNumber;
  final BaseResponse response;

  const DepositEddaYourBankDetailsState(
      {this.bankAccountNumber = '',
      this.response = const BaseResponse<Never>()})
      : super();

  @override
  List<Object> get props => [bankAccountNumber, response];

  DepositEddaYourBankDetailsState copyWith({
    String? bankAccountNumber,
    BaseResponse? response,
  }) {
    return DepositEddaYourBankDetailsState(
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        response: response ?? this.response);
  }
}
