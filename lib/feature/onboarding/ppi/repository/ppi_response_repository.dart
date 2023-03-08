import 'package:dio/dio.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../domain/ppi_api_repository.dart';
import '../domain/ppi_user_response.dart';
import '../domain/ppi_user_response_request.dart';
import 'bot_recommendation_repository.dart';

class PpiResponseRepository {
  static PpiResponseRepository? _instance;

  factory PpiResponseRepository() => _instance ??= PpiResponseRepository._();

  PpiResponseRepository._();

  final BotRecommendationRepository botRecommendationRepository =
      BotRecommendationRepository();

  final PpiApiRepository _ppiApiRepository = PpiApiRepository();
  final SharedPreference _sharedPreference = SharedPreference();

  Future<PpiUserResponse> addAnswer(
      PpiSelectionRequest ppiUserResponseRequest) async {
    var response =
        await _ppiApiRepository.postQuestionAnswer(ppiUserResponseRequest);

    var ppiUserResponse = PpiUserResponse.fromJson(response.data);

    return ppiUserResponse;
  }

  Future<PpiUserResponse> addBulkAnswer(
      List<PpiSelectionRequest> ppiUserResponseRequest) async {
    var response =
        await _ppiApiRepository.postBulkAnswer(ppiUserResponseRequest);

    return PpiUserResponse.fromJson(response.data);
  }

  Future<BaseResponse<SnapShot>> getUserSnapShot(int userId) async {
    try {
      var response = await _ppiApiRepository.getUserSnapshot(userId);
      return BaseResponse.complete(SnapShot.fromJson(response.data));
    } catch (_) {
      return BaseResponse.error(message: 'Failed to get data');
    }
  }

  Future<Response> linkUser(int userId) async {
    var response = await _ppiApiRepository.linkUser(userId);
    return response;
  }
}
