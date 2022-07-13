import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';

part 'risk_disclosure_event.dart';

class RiskDisclosureBloc extends Bloc<RiskDisclosureEvent, BaseResponse<bool>> {
  RiskDisclosureBloc() : super(BaseResponse(data: false)) {
    on<CompanyRiskDisclosureChanged>(_onCompanyRiskDisclosureChanged);
  }

  _onCompanyRiskDisclosureChanged(
      CompanyRiskDisclosureChanged event, Emitter<BaseResponse<bool>> emit) {
    emit(state.copyWith(data: event.companyDisclosureAgreementChecked));
  }
}
