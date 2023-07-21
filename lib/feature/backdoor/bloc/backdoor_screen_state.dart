part of 'backdoor_screen_bloc.dart';

class BackdoorScreenState extends Equatable {
  final String email;

  const BackdoorScreenState({this.email = ''});

  BackdoorScreenState copyWith({
    String? email,
  }) {
    return BackdoorScreenState(
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [email];
}
