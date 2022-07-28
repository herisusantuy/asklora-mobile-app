part of 'withdrawal_bloc.dart';

enum WithdrawalPages { welcome, bankDetail, amount, acknowledgement, unknown }

class WithdrawalState extends Equatable {
  final WithdrawalPages withdrawalPages;

  const WithdrawalState({this.withdrawalPages = WithdrawalPages.unknown})
      : super();

  @override
  List<Object> get props => [
        withdrawalPages,
      ];

  WithdrawalState copyWith({
    WithdrawalPages? withdrawalPages,
  }) {
    return WithdrawalState(
      withdrawalPages: withdrawalPages ?? this.withdrawalPages,
    );
  }
}
