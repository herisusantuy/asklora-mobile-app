import 'package:collection/collection.dart';

import '../../core/utils/storage/secure_storage.dart';
import '../bloc/app_bloc.dart';
import '../domain/user_journey_api_client.dart';

class UserJourneyRepository {
  final UserJourneyApiClient _userJourneyApiClient = UserJourneyApiClient();

  final _secureStorage = SecureStorage();

  Future<bool?> saveUserJourney(UserJourney userJourney) async {
    try {
      await _userJourneyApiClient.save();
    } catch (e) {
      print('masuk catch saving journey with user journey ${userJourney.name}');
      await _secureStorage.writeSecureData('user_journey', userJourney.name);
    }
    return true;
  }

  Future<UserJourney> getUserJourney() async {
    try {
      ///TODO GET RESPONSE FROM API
      await _userJourneyApiClient.get();
      print('try save');
      return UserJourney.privacyPersonalisation;
    } catch (e) {
      print('catch save');
      String? userJourney = await _secureStorage.readSecureData('user_journey');
      print('get user journey catch ${UserJourney.values
          .firstWhereOrNull((element) => element.name == userJourney)}');
      return UserJourney.values
              .firstWhereOrNull((element) => element.name == userJourney) ??
          UserJourney.privacyPersonalisation;
    }
  }
}
