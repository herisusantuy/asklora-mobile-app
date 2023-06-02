// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'source_of_wealth_bloc.dart';

class SourceOfWealthState extends Equatable {
  final List<SourceOfWealthModel> sourceOfWealthAnswers;
  final int totalAmount;
  final String errorMessage;
  final String errorPopupMessage;
  final bool isShowPopupMessage;

  const SourceOfWealthState({
    this.sourceOfWealthAnswers = const [],
    this.totalAmount = 0,
    this.errorMessage = '',
    this.errorPopupMessage = '',
    this.isShowPopupMessage = false,
  });

  SourceOfWealthState copyWith({
    List<SourceOfWealthModel>? sourceOfWealthAnswers,
    int? totalAmount,
    String? errorMessage,
    String? errorPopupMessage,
    bool? isShowPopupMessage,
  }) {
    return SourceOfWealthState(
      sourceOfWealthAnswers:
          sourceOfWealthAnswers ?? this.sourceOfWealthAnswers,
      totalAmount: totalAmount ?? this.totalAmount,
      errorMessage: errorMessage ?? this.errorMessage,
      errorPopupMessage: errorPopupMessage ?? this.errorPopupMessage,
      isShowPopupMessage: isShowPopupMessage ?? this.isShowPopupMessage,
    );
  }

  @override
  List<Object?> get props => [
        sourceOfWealthAnswers,
        totalAmount,
        errorMessage,
        errorPopupMessage,
        isShowPopupMessage,
        DateTime.now()
      ];

  bool enableNextButton() {
    return sourceOfWealthAnswers.isNotEmpty;
  }
}
