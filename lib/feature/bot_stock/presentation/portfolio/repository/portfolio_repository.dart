import 'dart:async';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/feature_flags.dart';
import '../../../../../mock/mock_data.dart';
import '../domain/portfolio_response.dart';

class PortfolioRepository {
  Future<BaseResponse<PortfolioResponse>> fetchPortfolio() async {
    try {
      if (FeatureFlags.isDemoEnable) {
        ///MOCK
        await Future.delayed(const Duration(milliseconds: 500));
        return BaseResponse.complete(
            await MockData().fetchPortfolioDetailResponse());
      } else {
        ///REAL
        await Future.delayed(const Duration(seconds: 1));
        return BaseResponse.complete(PortfolioResponse());
      }
    } catch (e) {
      return BaseResponse.error();
    }
  }
}
