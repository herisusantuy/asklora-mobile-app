import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';

part 'review_information_event.dart';

class ReviewInformationBloc extends Bloc<ReviewInformationEvent, BaseResponse<bool>> {
  ReviewInformationBloc() : super(const BaseResponse(data: false)) {
    on<ReviewInformationAgreementChanged>(_onReviewInformationAgreementChanged);
  }

  _onReviewInformationAgreementChanged(
      ReviewInformationAgreementChanged event, Emitter<BaseResponse<bool>> emit) {
    emit(state.copyWith(data: event.reviewInformationAgreementChecked));
  }
}
