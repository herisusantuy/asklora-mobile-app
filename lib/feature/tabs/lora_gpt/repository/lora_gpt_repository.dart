import '../../../../core/domain/base_response.dart';
import '../../../ai/investment_style_question/domain/investment_style_question_query_request.dart';
import '../../../ai/investment_style_question/domain/investment_style_question_query_response.dart';
import '../domain/conversation.dart';
import '../domain/lora_gpt_api_client.dart';
import '../domain/portfolio_details_request.dart';
import '../domain/portfolio_query_request.dart';
import '../domain/query_request.dart';

class LoraGptRepository {
  final LoraGptClient _loraGptClient = LoraGptClient();

  Future<BaseResponse<Lora>> general(
      {required GeneralQueryRequest params}) async {
    try {
      var response = await _loraGptClient.general(params.params);
      return BaseResponse.complete<Lora>(Lora.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }

  Future<BaseResponse<Lora>> portfolioDetails(
      {required PortfolioDetailsRequest params}) async {
    try {
      var response = await _loraGptClient.portfolioDetails(params.params);
      return BaseResponse.complete<Lora>(Lora.fromJson(response.data));
    } catch (e) {
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
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }

  Future<BaseResponse<InvestmentStyleQuestionQueryResponse>> investmentStyle(
      {required InvestmentStyleQuestionQueryRequest params}) async {
    try {
      var response = await _loraGptClient.investmentStyle(params);
      return BaseResponse.complete(
          InvestmentStyleQuestionQueryResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }
}
