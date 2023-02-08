import 'package:collection/collection.dart';

import '../../core/utils/storage/shared_preference.dart';
import '../../core/utils/storage/storage_keys.dart';
import '../bloc/app_bloc.dart';
import '../domain/user_journey_api_client.dart';

class UserJourneyRepository {
  final UserJourneyApiClient _userJourneyApiClient = UserJourneyApiClient();

  final _sharedPreference = SharedPreference();

  Future<bool?> saveUserJourney(UserJourney userJourney) async {
    try {
      ///TODO POST RESPONSE TO API
      await _userJourneyApiClient.save();
    } catch (e) {
      await _sharedPreference.writeData(sfKeyUserJourney, userJourney.name);
    }
    return true;
  }

  Future<UserJourney> getUserJourney() async {
    try {
      ///TODO GET RESPONSE FROM API
      await _userJourneyApiClient.get();
      return UserJourney.privacy;
    } catch (e) {
      String? userJourney = await _sharedPreference.readData(sfKeyUserJourney);
      return UserJourney.values
              .firstWhereOrNull((element) => element.name == userJourney) ??
          UserJourney.privacy;
    }
  }
}
