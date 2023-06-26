import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/log.dart';
import '../domain/conversation.dart';
import '../domain/lora_gpt_api_client.dart';
import '../domain/portfolio_query_request.dart';
import '../domain/query_request.dart';

class LoraGptRepository {
  final LoraGptClient _loraGptClient = LoraGptClient();

  Future<BaseResponse<Lora>> general(QueryRequest request) async {
    try {
      var response = await _loraGptClient.general(request.params);
      return BaseResponse.complete<Lora>(Lora.fromJson(response.data));
    } catch (e) {
      Logger.log(e.toString());
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }

  Future<BaseResponse<Lora>> portfolio(
      {required PortfolioQueryRequest params,
      required List<Botstock> data}) async {
    try {
      var response =
          await _loraGptClient.portfolio(params: params.params, payload: data);
      return BaseResponse.complete<Lora>(Lora.fromJson(response.data));
    } catch (e) {
      Logger.log(e.toString());
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }
}
