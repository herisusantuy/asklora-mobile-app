import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/risk_disclosure/risk_disclosure_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Risk Disclosure Bloc Tests', () {
    late RiskDisclosureBloc riskDisclosureBloc;

    setUp(() async {
      riskDisclosureBloc = RiskDisclosureBloc();
    });

    test('Risk Disclosure init state data should be `false`', () {
      expect(riskDisclosureBloc.state, const BaseResponse(data: false));
    });

    blocTest<RiskDisclosureBloc, BaseResponse<bool>>(
        'emits `data: true` WHEN '
        'Tap check box once',
        build: () {
          return riskDisclosureBloc;
        },
        act: (bloc) => bloc.add(const CompanyRiskDisclosureChanged(true)),
        expect: () => {
              const BaseResponse(data: true),
            });

    blocTest<RiskDisclosureBloc, BaseResponse<bool>>(
        'emits `data: false` WHEN '
        'Tap check box twice',
        build: () {
          return riskDisclosureBloc;
        },
        act: (bloc) {
          bloc.add(const CompanyRiskDisclosureChanged(true));
          bloc.add(const CompanyRiskDisclosureChanged(false));
        },
        expect: () => {
              const BaseResponse(data: true),
              const BaseResponse(data: false),
            });

    tearDown(() => {riskDisclosureBloc.close()});
  });
}
