part of 'backdoor_screen_bloc.dart';

class BackdoorScreenState extends Equatable {
  final String baseUrl;

  const BackdoorScreenState({this.baseUrl = ''});

  BackdoorScreenState copyWith({
    String? baseUrl,
  }) {
    return BackdoorScreenState(
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  @override
  List<Object?> get props => [baseUrl];
}
