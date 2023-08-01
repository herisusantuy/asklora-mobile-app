import '../utils/storage/shared_preference.dart';
import '../utils/storage/storage_keys.dart';

class TutorialRepository {
  final SharedPreference _sharedPreference = SharedPreference();

  Future<bool> saveBotDetailTutorialState(bool tutorialState) async {
    await _sharedPreference.writeBoolData(
        sfKeyBotDetailsTutorial, tutorialState);
    return tutorialState;
  }

  Future<bool> saveBotRecommendationTutorialState(bool tutorialState) async {
    await _sharedPreference.writeBoolData(
        sfKeyBotRecommendationTutorial, tutorialState);
    return tutorialState;
  }

  Future<bool> saveTradeSummaryTutorialState(bool tutorialState) async {
    await _sharedPreference.writeBoolData(
        sfKeyTradeSummaryTutorial, tutorialState);
    return tutorialState;
  }

  Future<bool> fetchBotDetailTutorialState() async {
    bool? response =
        await _sharedPreference.readBoolData(sfKeyBotDetailsTutorial);
    return response ?? true;
  }

  Future<bool> fetchBotRecommendationTutorialState() async {
    bool? response =
        await _sharedPreference.readBoolData(sfKeyBotRecommendationTutorial);
    return response ?? true;
  }

  Future<bool> fetchTradeSummaryTutorialState() async {
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
