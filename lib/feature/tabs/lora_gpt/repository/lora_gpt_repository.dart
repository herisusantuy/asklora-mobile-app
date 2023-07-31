import '../../../../core/domain/base_response.dart';
import '../../../ai/investment_style_question/domain/investment_style_question_query_request.dart';
import '../../../ai/investment_style_question/domain/investment_style_question_query_response.dart';
import '../domain/lora_gpt_api_client.dart';
import '../domain/portfolio_details_request.dart';
import '../domain/portfolio_query_request.dart';
import '../domain/query_request.dart';
import '../domain/query_response.dart';

class LoraGptRepository {
  final LoraGptClient _loraGptClient = LoraGptClient();

  Future<BaseResponse<QueryResponse>> general(
      {required GeneralQueryRequest params}) async {
    try {
      var response = await _loraGptClient.general(params.params);
      return BaseResponse.complete(QueryResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }

  Future<BaseResponse<QueryResponse>> portfolioDetails(
      {required PortfolioDetailsRequest params}) async {
    try {
      var response = await _loraGptClient.portfolioDetails(params.params);
      return BaseResponse.complete(QueryResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }

  Future<BaseResponse<QueryResponse>> portfolio(
      {required PortfolioQueryRequest params,
      required List<Botstock> data}) async {
    try {
      var response =
          await _loraGptClient.portfolio(params: params.params, payload: data);
      return BaseResponse.complete(QueryResponse.fromJson(response.data));
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

  Future<BaseResponse<QueryResponse>> botIntro(
      {required BotstockIntro params}) async {
    try {
      final response = await _loraGptClient.botIntro(params.params);

      return BaseResponse.complete(QueryResponse.fromJson(response.data));
      //QueryResponse queryResponse = QueryResponse.fromJson(response.data);
      // return BaseResponse.complete(QueryResponse('a', 'b', 'c', false, components: [
      //   PromptButton('prompt_btn', 'choice 1'),
      //   PromptButton('prompt_btn', 'choice 2'),
      //   PromptButton('prompt_btn', 'choice 3'),
      // ],results: const ['hello', 'what are you doing?']));
    } catch (e) {
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }

  Future<BaseResponse<QueryResponse>> botEarnings(
      {required BotstockIntro params}) async {
    try {
      var response = await _loraGptClient.botIntroEarnings(params.params);
      return BaseResponse.complete(QueryResponse.fromJson(response.data));
      // return BaseResponse.complete(
      //     QueryResponse('d', 'e', 'f', false, components: [
      //   PromptButton('prompt_btn', 'choice a'),
      //   PromptButton('prompt_btn', 'choice b'),
      //   PromptButton('prompt_btn', 'choice c'),
      // ], results: const [
      //   'hello 2',
      //   'what are you doing 2?'
      // ]));
    } catch (e) {
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }
}
