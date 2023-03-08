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

  Future<UserJourney> getUserJourney() async {
    String? localUserJourneyString =
        await _sharedPreference.readData('user_journey');
    UserJourney? localUserJourney = UserJourney.values
        .firstWhereOrNull((element) => element.value == localUserJourneyString);
    try {
      var response = await _userJourneyApiClient.get();

      var userJourneyResponse = UserJourneyResponse.fromJson(response.data);

      var indexUserJourneyResponse = UserJourney.values.indexWhere(
          (element) => element.value == userJourneyResponse.userJourney);
      var indexUserJourneyLocal = UserJourney.values
          .indexWhere((element) => element.value == localUserJourney?.value);

      if (indexUserJourneyResponse < indexUserJourneyLocal) {
        saveUserJourney(userJourney: localUserJourney!);
        return localUserJourney;
      } else {
        return UserJourney.values.firstWhereOrNull((element) =>
                element.value == userJourneyResponse.userJourney) ??
            UserJourney.privacy;
      }
    } catch (e) {
      return localUserJourney ?? UserJourney.privacy;
    }
  }
}
