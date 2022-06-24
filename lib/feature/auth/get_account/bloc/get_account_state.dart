part of 'get_account_bloc.dart';

abstract class GetAccountState extends Equatable {
  const GetAccountState();
  
  @override
  List<Object> get props => [];
}

class GetAccountInitial extends GetAccountState {}
