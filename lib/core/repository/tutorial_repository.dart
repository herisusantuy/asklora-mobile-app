import '../utils/storage/shared_preference.dart';
import '../utils/storage/storage_keys.dart';

class TutorialRepository {
  final SharedPreference _sharedPreference = SharedPreference();

  Future<bool> setBotDetailsTutorial(bool value) async {
    bool response =
        await _sharedPreference.writeBoolData(sfKeyBotDetailsTutorial, value);
    return response;
  }

  Future<bool> isBotDetailsTutorial() async {
    bool? response =
        await _sharedPreference.readBoolData(sfKeyBotDetailsTutorial);
    return response ?? true;
  }
}
