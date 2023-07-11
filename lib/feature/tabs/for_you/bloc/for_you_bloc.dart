import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../repository/for_you_repository.dart';

part 'for_you_event.dart';

part 'for_you_state.dart';

class ForYouBloc extends Bloc<ForYouEvent, ForYouState> {
  ForYouBloc({required ForYouRepository forYouRepository})
      : _forYouRepository = forYouRepository,
        super(const ForYouState()) {
    on<GetInvestmentStyleState>(_onGetInvestmentStyleState);
    on<SaveInvestmentStyleState>(_onSaveInvestmentStyleState);
  }

  final ForYouRepository _forYouRepository;

  _onGetInvestmentStyleState(
      GetInvestmentStyleState event, Emitter<ForYouState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var data = await _forYouRepository.getInvestmentStyleState();
    emit(state.copyWith(response: data));
  }

  _onSaveInvestmentStyleState(
      SaveInvestmentStyleState event, Emitter<ForYouState> emit) async {
    var data = await _forYouRepository.saveInvestmentStyleState();
    emit(state.copyWith(response: data));
  }
}
