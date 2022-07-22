part of 'withdraw_bloc.dart';

abstract class WithdrawEvent extends Equatable {
  const WithdrawEvent() : super();

  @override
  List<Object?> get props => [];
}

class PageChanged extends WithdrawEvent {
  final WithdrawPages withdrawPages;

  const PageChanged(this.withdrawPages) : super();

  @override
  List<Object> get props => [withdrawPages];
}
