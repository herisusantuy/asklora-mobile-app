import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/UtilTest/storage/shared_preference.dart';
import '../../../../core/UtilTest/storage/storage_keys.dart';
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

  final SharedPreference _sharedPreference = SharedPreference();

  final PpiApiRepository _ppiApiRepository = PpiApiRepository();

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

  Future<BaseResponse<SnapShot>> getUserSnapShotUserId(dynamic userId) async {
    try {
      var response = await _ppiApiRepository.getUserSnapshotByUserId(userId);
      SnapShot snapshot = SnapShot.fromJson(response.data);
      await saveUserSnapShotToLocal(snapshot);
      return BaseResponse.complete(snapshot);
    } catch (_) {
      return BaseResponse.error(message: 'Failed to get data');
    }
  }

  Future<void> saveUserSnapShotToLocal(SnapShot snapshot) async {
    await _sharedPreference.writeData(sfKeyPpiAccountId, snapshot.accountId);
    await _sharedPreference.writeIntData(sfKeyPpiUserId, snapshot.id);
    await _sharedPreference.writeData(sfKeyPpiName, snapshot.name);
    await _sharedPreference.writeData(sfKeyPpiSnapshot, jsonEncode(snapshot));
  }

  Future<SnapShot?> getUserSnapShotFromLocal(
      {bool forceToFetch = false}) async {
    var data = await _sharedPreference.readData(sfKeyPpiSnapshot);
    if (data == null || forceToFetch) {
      try {
        var askloraId = await _sharedPreference.readIntData(sfKeyAskloraId);
        final response = await getUserSnapshotByAskloraId(askloraId ?? 0);
        return response.data;
      } catch (e) {
        return null;
      }
    } else {
      return SnapShot.fromJson(jsonDecode(data));
    }
  }

  Future<BaseResponse<SnapShot>> getUserSnapshotByAskloraId(
      int askloraId) async {
    try {
      var response =
          await _ppiApiRepository.getUserSnapshotByAskloraId(askloraId);
      SnapShot snapshot = SnapShot.fromJson(response.data);
      await saveUserSnapShotToLocal(snapshot);
      return BaseResponse.complete(snapshot);
    } catch (_) {
      return BaseResponse.error(message: 'Failed to get data');
    }
  }

  Future<Response> linkUser(int userId) async =>
      await _ppiApiRepository.linkUser(userId);
}
