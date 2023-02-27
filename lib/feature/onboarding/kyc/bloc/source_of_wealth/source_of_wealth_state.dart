part of 'source_of_wealth_bloc.dart';

class SourceOfWealthState extends Equatable {
  final List<SourceOfWealthModel> sourceOfWealthAnswers;
  final int totalAmount;
  final String errorMessage;

  const SourceOfWealthState({
    this.sourceOfWealthAnswers = const [],
    this.totalAmount = 0,
    this.errorMessage = '',
  });

  SourceOfWealthState copyWith({
    List<SourceOfWealthModel>? sourceOfWealthAnswers,
    int? totalAmount,
    String? errorMessage,
  }) {
    return SourceOfWealthState(
      sourceOfWealthAnswers:
          sourceOfWealthAnswers ?? this.sourceOfWealthAnswers,
      totalAmount: totalAmount ?? this.totalAmount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        sourceOfWealthAnswers,
        totalAmount,
        errorMessage,
      ];

  bool enableNextButton() {
    return totalAmount > 0;
  }
}
