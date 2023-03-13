import 'package:collection/collection.dart';

import '../../core/domain/base_response.dart';
import '../../core/utils/storage/shared_preference.dart';
import '../../core/utils/storage/storage_keys.dart';
import '../bloc/app_bloc.dart';
import '../domain/user_journey_api_client.dart';
import '../domain/user_journey_request.dart';
import '../domain/user_journey_response.dart';

class UserJourneyRepository {
  final UserJourneyApiClient _userJourneyApiClient = UserJourneyApiClient();

  final _sharedPreference = SharedPreference();

  Future<BaseResponse<UserJourneyResponse>> saveUserJourney(
      {required UserJourney userJourney, String? data}) async {
    await _sharedPreference.writeData(sfKeyUserJourney, userJourney.value);
    await _sharedPreference.writeData(sfKeyUserJourneyData, data ?? '');
    try {
      var response = await _userJourneyApiClient
          .save(UserJourneyRequest(userJourney: userJourney.value, data: data));
      var userJourneyResponse = UserJourneyResponse.fromJson(response.data!);
      return BaseResponse.complete(userJourneyResponse);
    } catch (e) {
      ///TODO POST TO FIREBASE
      return BaseResponse.error(message: 'Failed save user journey!');
    }
  }

  void saveUserJourneyToLocal(
      {required UserJourney userJourney, String? data}) async {
    await _sharedPreference.writeData(sfKeyUserJourney, userJourney.value);
    await _sharedPreference.writeData(sfKeyUserJourneyData, data ?? '');
  }

  Future<UserJourney?> getUserJourneyFromLocal() async {
    String? localUserJourneyString =
    await _sharedPreference.readData(sfKeyUserJourney);
    UserJourney? localUserJourney = UserJourney.values
        .firstWhereOrNull((element) => element.value == localUserJourneyString)??UserJourney.investmentStyle;
    return localUserJourney;
  }

  Future<UserJourney> getUserJourney() async {
    String? localUserJourneyString =
        await _sharedPreference.readData(sfKeyUserJourney);
    String? localUserJourneyDataString =
        await _sharedPreference.readData(sfKeyUserJourneyData);
    UserJourney? localUserJourney = UserJourney.values
        .firstWhereOrNull((element) => element.value == localUserJourneyString);
    try {
      var response = await _userJourneyApiClient.get();

      var userJourneyResponse = UserJourneyResponse.fromJson(response.data);
      await _sharedPreference.writeIntData(
          sfKeyAskloraId, userJourneyResponse.user!);

      var indexUserJourneyResponse = UserJourney.values.indexWhere(
          (element) => element.value == userJourneyResponse.userJourney);
      var indexUserJourneyLocal = UserJourney.values
          .indexWhere((element) => element.value == localUserJourney?.value);

      if (indexUserJourneyResponse < indexUserJourneyLocal) {
        saveUserJourney(
            userJourney: localUserJourney!, data: localUserJourneyDataString);
        return localUserJourney;
      } else {
        UserJourney userJourney = UserJourney.values.firstWhereOrNull(
                (element) =>
                    element.value == userJourneyResponse.userJourney) ??
            UserJourney.investmentStyle;
        saveUserJourneyToLocal(
            userJourney: userJourney, data: userJourneyResponse.data);
        return userJourney;
      }
    } catch (e) {
      return localUserJourney ?? UserJourney.investmentStyle;
    }
  }

  Future<BaseResponse<UserJourneyResponse>> getUserJourneyWithData() async {
    try {
      var response = await _userJourneyApiClient.get();
      return BaseResponse.complete(UserJourneyResponse.fromJson(response.data));
    } catch (_) {
      return BaseResponse.error();
    }
  }
}
