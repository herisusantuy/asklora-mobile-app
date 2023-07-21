import '../utils/storage/shared_preference.dart';
import '../utils/storage/storage_keys.dart';

class TutorialRepository {
  final SharedPreference _sharedPreference = SharedPreference();

  Future<bool> saveTutorialState(bool tutorialState) async {
    await _sharedPreference.writeBoolData(
        sfKeyBotDetailsTutorial, tutorialState);
    return tutorialState;
  }

  Future<bool> fetchTutorialState() async {
    bool? response =
        await _sharedPreference.readBoolData(sfKeyBotDetailsTutorial);
    return response ?? true;
  }

  Future<bool> isTradeSummaryTutorial() async {
    bool? response =
        await _sharedPreference.readBoolData(sfKeyTradeSummaryTutorial);
    return response ?? true;
  }

  Future<bool> setTradeSummaryTutorialFinished() async {
    bool response =
        await _sharedPreference.writeBoolData(sfKeyTradeSummaryTutorial, false);
    return response;
  }
}
