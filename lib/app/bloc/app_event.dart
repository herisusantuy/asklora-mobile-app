part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent() : super();

  @override
  List<Object?> get props => [];
}

class AppLaunched extends AppEvent {}
