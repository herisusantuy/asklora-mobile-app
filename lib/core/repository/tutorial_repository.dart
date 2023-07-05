import '../utils/storage/shared_preference.dart';
import '../utils/storage/storage_keys.dart';

class TutorialRepository {
  final SharedPreference _sharedPreference = SharedPreference();

  Future<bool> botDetailsTutorialFinished() async {
    bool response =
        await _sharedPreference.writeBoolData(sfKeyBotDetailsTutorial, false);
    return response;
  }

  Future<bool> setTradeSummaryTutorial() async {
    bool response =
        await _sharedPreference.writeBoolData(sfKeyTradeSummaryTutorial, false);
    return response;
  }

  Future<bool> isBotDetailsTutorial() async {
    bool? response =
        await _sharedPreference.readBoolData(sfKeyBotDetailsTutorial);
    if (response != null) {
      print('sfKeyBotDetails tutorial (not null): $response');
      return response;
    } else {
      print('sfKeyBotDetails tutorial (null): $response');
      return true;
    }
  }

  Future<bool> isTradeSummaryTutorial() async {
    bool? response =
        await _sharedPreference.readBoolData(sfKeyTradeSummaryTutorial);
    return response ?? true;
  }
}
