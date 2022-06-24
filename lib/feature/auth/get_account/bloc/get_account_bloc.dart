import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_account_event.dart';
part 'get_account_state.dart';

class GetAccountBloc extends Bloc<GetAccountEvent, GetAccountState> {
  GetAccountBloc() : super(GetAccountInitial()) {
    on<GetAccountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
