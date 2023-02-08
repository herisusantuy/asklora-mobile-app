part of 'source_of_wealth_bloc.dart';

class SourceOfWealthState extends Equatable {
  final List<SourceOfWealthModel> sourceOfWealthAnswers;
  final int totalOfSourceOFWealthAmount;
  final String errorMessage;

  const SourceOfWealthState({
    this.sourceOfWealthAnswers = const [],
    this.totalOfSourceOFWealthAmount = 0,
    this.errorMessage = '',
  });

  SourceOfWealthState copyWith({
    List<SourceOfWealthModel>? sourceOfWealthAnswers,
    int? totalOfSourceOFWealthAmount,
    String? errorMessage,
  }) {
    return SourceOfWealthState(
      sourceOfWealthAnswers:
          sourceOfWealthAnswers ?? this.sourceOfWealthAnswers,
      totalOfSourceOFWealthAmount:
          totalOfSourceOFWealthAmount ?? this.totalOfSourceOFWealthAmount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props {
    return [
      sourceOfWealthAnswers,
      totalOfSourceOFWealthAmount,
      errorMessage,
    ];
  }

  bool enableNextButton() {
    if (totalOfSourceOFWealthAmount > 0) {
      return false;
    } else {
      return true;
    }
  }
}
