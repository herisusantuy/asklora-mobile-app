part of 'withdrawal_bloc.dart';

abstract class WithdrawalEvent extends Equatable {
  const WithdrawalEvent() : super();

  @override
  List<Object?> get props => [];
}

class PageChanged extends WithdrawalEvent {
  final WithdrawalPages withdrawPages;

  const PageChanged(this.withdrawPages) : super();

  @override
  List<Object> get props => [withdrawPages];
}
