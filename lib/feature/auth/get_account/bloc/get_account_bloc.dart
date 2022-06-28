// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../domain/get_account_response.dart';
import '../repository/get_account_repository.dart';

part 'get_account_event.dart';
part 'get_account_state.dart';

class GetAccountBloc extends Bloc<GetAccountEvent, GetAccountState> {
  GetAccountBloc({required GetAccountRepository getAccountRepository})
      : _getAccountRepository = getAccountRepository,
        super(const GetAccountState()) {
    on<GetAccountSubmitted>(_onGetAccountSubmitted);
  }

  final GetAccountRepository _getAccountRepository;

  _onGetAccountSubmitted(
      GetAccountSubmitted event, Emitter<GetAccountState> emit) async {
    try {
      emit(state.copyWith(status: GetAccountStatus.loading));
      var response = await _getAccountRepository.getAccount();
      emit(
        state.copyWith(
          status: GetAccountStatus.success,
          responseMessage: 'Successfully get account!',
          account: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Get account is failed!'));
    }
  }
}
