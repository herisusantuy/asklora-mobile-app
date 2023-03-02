// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BaseResponse<SnapShot> response;
  const HomeState({
    this.response = const BaseResponse(),
  });

  @override
  List<Object> get props => [response];

  HomeState copyWith({
    BaseResponse<SnapShot>? response,
  }) {
    return HomeState(
      response: response ?? this.response,
    );
  }
}
