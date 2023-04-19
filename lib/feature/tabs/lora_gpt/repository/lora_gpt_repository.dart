import '../../../../core/domain/base_response.dart';
import '../domain/conversation.dart';
import '../domain/lora_gpt_api_client.dart';
import '../domain/query_request.dart';

class LoraGptRepository {
  final LoraGptClient _loraGptClient = LoraGptClient();

  Future<BaseResponse<Lora>> searchQuery(QueryRequest request) async {
    try {
      var response = await _loraGptClient.searchQuery(request.params);
      return BaseResponse.complete<Lora>(Lora.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(
          message: 'Something went wrong. Please try again!');
    }
  }
}
