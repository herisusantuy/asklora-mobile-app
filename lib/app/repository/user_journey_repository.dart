import 'package:collection/collection.dart';

import '../../core/utils/storage/secure_storage.dart';
import '../bloc/app_bloc.dart';
import '../domain/user_journey_api_client.dart';

class UserJourneyRepository {
  final UserJourneyApiClient _userJourneyApiClient = UserJourneyApiClient();

  final _secureStorage = SecureStorage();

  Future<bool?> saveUserJourney(UserJourney userJourney) async {
    try {
      ///TODO POST RESPONSE TO API
      await _userJourneyApiClient.save();
    } catch (e) {
      await _secureStorage.writeSecureData('user_journey', userJourney.name);
    }
    return true;
  }

  Future<UserJourney> getUserJourney() async {
    try {
      ///TODO GET RESPONSE FROM API
      await _userJourneyApiClient.get();
      return UserJourney.privacyPersonalisation;
    } catch (e) {
      String? userJourney = await _secureStorage.readSecureData('user_journey');
      return UserJourney.values
              .firstWhereOrNull((element) => element.name == userJourney) ??
          UserJourney.privacyPersonalisation;
    }
  }
}
