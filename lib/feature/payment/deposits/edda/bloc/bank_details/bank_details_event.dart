part of 'bank_details_bloc.dart';

abstract class BankDetailsEvent extends Equatable {
  const BankDetailsEvent() : super();

  @override
  List<Object?> get props => [];
}

class BankAccountNumberChanged extends BankDetailsEvent {
  final String value;

  const BankAccountNumberChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}

class BankDetailsSubmitted extends BankDetailsEvent {
  const BankDetailsSubmitted() : super();
}
