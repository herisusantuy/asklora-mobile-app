import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/shared_preference.dart';

class ForYouRepository {
  final _sharedPreference = SharedPreference();

  static ForYouRepository? _instance;

  factory ForYouRepository() => _instance ??= ForYouRepository._();

  ForYouRepository._();

  ///TODO save object type answer later
  Future<BaseResponse<String>> saveInvestmentStyleAnswer() async {
    String answer = 'some answer';
    _sharedPreference.writeData('investment_style_answer', answer);
    return BaseResponse.complete(answer);
  }

  ///TODO get object type answer later
  Future<BaseResponse<String>> getInvestmentStyleAnswer() async {
    String? investmentStyleAnswer =
        await _sharedPreference.readData('investment_style_answer');
    if (investmentStyleAnswer != null) {
      return BaseResponse.complete(investmentStyleAnswer);
    } else {
      return BaseResponse.error('Answer not found');
    }
  }
}
