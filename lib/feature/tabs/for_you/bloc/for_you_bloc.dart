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
    on<GetInvestmentStyleAnswer>(_onGetInvestmentStyleAnswer);
    on<SaveInvestmentStyleAnswer>(_onSaveInvestmentStyleAnswer);
  }

  final ForYouRepository _forYouRepository;

  _onGetInvestmentStyleAnswer(
      GetInvestmentStyleAnswer event, Emitter<ForYouState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var data = await _forYouRepository.getInvestmentStyleAnswer();
    emit(state.copyWith(response: data));
  }

  _onSaveInvestmentStyleAnswer(
      SaveInvestmentStyleAnswer event, Emitter<ForYouState> emit) async {
    await _forYouRepository.saveInvestmentStyleAnswer();
  }
}
