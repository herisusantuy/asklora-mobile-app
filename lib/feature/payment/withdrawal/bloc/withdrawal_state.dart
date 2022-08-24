part of 'withdrawal_bloc.dart';

enum WithdrawalPagesStep {
  welcome,
  bankDetail,
  amount,
  acknowledgement,
  unknown
}

class WithdrawalState extends Equatable {
  final BaseResponse<WithdrawalResponse> response;

  const WithdrawalState({this.response = const BaseResponse()}) : super();

  @override
  List<Object> get props => [
        response,
      ];

  WithdrawalState copyWith({
    BaseResponse<WithdrawalResponse>? response,
  }) {
    return WithdrawalState(
      response: response ?? this.response,
    );
  }
}
