import 'package:asklora_mobile_chart/main.dart';
import 'package:asklora_mobile_chart/model/triplet.dart';
import 'package:asklora_mobile_chart/model/ui_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../bot_stock/repository/bot_stock_repository.dart';
import '../../../../onboarding/ppi/domain/ppi_user_response.dart';

part 'demonstration_bot_event.dart';

part 'demonstration_bot_state.dart';

class DemonstrationBotBloc
    extends Bloc<DemonstrationBotEvent, DemonstrationBotState> {
  DemonstrationBotBloc({required BotStockRepository botStockRepository})
      : _botStockRepository = botStockRepository,
        super(const DemonstrationBotState()) {
    on<FetchBotDemonstration>(_onFetchBotDemonstration);
    on<FetchChartData>(_onFetchChartData);
    on<FetchTradeChartData>(_onFetchTradeChartData);
  }

  final BotStockRepository _botStockRepository;

  _onFetchBotDemonstration(
      FetchBotDemonstration event, Emitter<DemonstrationBotState> emit) async {
    try {
      emit(state.copyWith(botDemonstrationResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botDemonstrationResponse:
              await _botStockRepository.fetchBotDemonstration()));
    } catch (e) {
      emit(state.copyWith(
          botDemonstrationResponse:
              BaseResponse.error('Something went wrong')));
    }
  }

  _onFetchChartData(
      FetchChartData event, Emitter<DemonstrationBotState> emit) async {
    try {
      emit(state.copyWith(
          chartDataResponse: await _botStockRepository.fetchChartDataJson()));
    } catch (e) {
      emit(state.copyWith(
          chartDataResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onFetchTradeChartData(
      FetchTradeChartData event, Emitter<DemonstrationBotState> emit) async {
    try {
      emit(state.copyWith(
          tradeChartDataResponse:
              await _botStockRepository.fetchTradeChartDataJson()));
    } catch (e) {
      emit(state.copyWith(
          tradeChartDataResponse: BaseResponse.error('Something went wrong')));
    }
  }
}
