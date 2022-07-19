part of 'review_information_bloc.dart';

abstract class ReviewInformationEvent extends Equatable {
  const ReviewInformationEvent();

  @override
  List<Object> get props => [];
}

class ReviewInformationAgreementChanged extends ReviewInformationEvent {
  final bool reviewInformationAgreementChecked;

  const ReviewInformationAgreementChanged(this.reviewInformationAgreementChecked)
      : super();

  @override
  List<Object> get props => [reviewInformationAgreementChecked];
}
