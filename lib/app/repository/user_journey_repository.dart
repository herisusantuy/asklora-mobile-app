import 'package:collection/collection.dart';

import '../../core/domain/base_response.dart';
import '../../core/utils/storage/shared_preference.dart';
import '../bloc/app_bloc.dart';
import '../domain/user_journey_api_client.dart';
import '../domain/user_journey_request.dart';
import '../domain/user_journey_response.dart';

class UserJourneyRepository {
  final UserJourneyApiClient _userJourneyApiClient = UserJourneyApiClient();

  final _sharedPreference = SharedPreference();

  Future<BaseResponse<UserJourneyResponse>> saveUserJourney(
      {required UserJourney userJourney, String? data}) async {
    var response = await _userJourneyApiClient
        .save(UserJourneyRequest(userJourney: userJourney.value, data: data));
    var userJourneyResponse = UserJourneyResponse.fromJson(response.data!);
    return BaseResponse.complete(userJourneyResponse);
  }

  Future<BaseResponse<UserJourneyResponse>> getUserJourney() async {
    var response = await _userJourneyApiClient.get();
    var userJourneyResponse = UserJourneyResponse.fromJson(response.data);
    return BaseResponse.complete(userJourneyResponse);
  }
}
