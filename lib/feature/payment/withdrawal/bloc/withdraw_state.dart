part of 'withdraw_bloc.dart';

enum WithdrawPages { welcome, bankDetail }

class WithdrawState extends Equatable {
  final WithdrawPages withdrawPages;

  const WithdrawState({this.withdrawPages = WithdrawPages.welcome}) : super();

  @override
  List<Object> get props => [
        withdrawPages,
      ];

  WithdrawState copyWith({
    WithdrawPages? withdrawPages,
  }) {
    return WithdrawState(
      withdrawPages: withdrawPages ?? this.withdrawPages,
    );
  }
}
