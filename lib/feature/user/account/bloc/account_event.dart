part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetAccount extends AccountEvent {}

class UpgradeAccount extends AccountEvent {
  final String email;

  const UpgradeAccount(this.email);
}

class GetSdkToken extends AccountEvent {}
