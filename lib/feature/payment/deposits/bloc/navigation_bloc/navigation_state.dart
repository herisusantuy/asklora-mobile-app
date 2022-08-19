part of 'navigation_bloc.dart';

class NavigationState<T> extends Equatable {
  final T page;
  final bool? lastPage;

  const NavigationState({required this.page, this.lastPage = false}) : super();

  @override
  List<Object?> get props => [page, lastPage];

  NavigationState<T> copyWith({
    T? page,
    bool? lastPage,
  }) {
    return NavigationState(
      page: page ?? this.page,
      lastPage: lastPage ?? this.lastPage,
    );
  }
}
