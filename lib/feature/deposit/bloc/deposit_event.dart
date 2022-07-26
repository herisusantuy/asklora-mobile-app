part of 'deposit_bloc.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent() : super();

  @override
  List<Object?> get props => [];
}

class PageChanged extends DepositEvent {
  final DepositPages depositPages;

  const PageChanged(this.depositPages) : super();

  @override
  List<Object?> get props => [depositPages];
}
