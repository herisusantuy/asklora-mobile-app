import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/shared_preference.dart';

class ForYouRepository {
  final _sharedPreference = SharedPreference();

  static ForYouRepository? _instance;

  factory ForYouRepository() => _instance ??= ForYouRepository._();

  ForYouRepository._();

  Future<BaseResponse<bool>> saveInvestmentStyleState() async {
    bool investmentStyleState = true;
    _sharedPreference.writeBoolData(
        'investment_style_state', investmentStyleState);
    return BaseResponse.complete(investmentStyleState);
  }

  Future<BaseResponse<bool>> getInvestmentStyleState() async {
    bool? investmentStyleState =
        await _sharedPreference.readBoolData('investment_style_state');
    if (investmentStyleState != null) {
      return BaseResponse.complete(investmentStyleState);
    } else {
      return BaseResponse.error('Answer not found');
    }
  }
}
