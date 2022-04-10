part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState extends Equatable {}

class HomePageLoading extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageError extends HomePageState {
  final Failure failure;

  HomePageError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class HomePageLoaded extends HomePageState {
  final List<SetList> setLists;

  HomePageLoaded(this.setLists);

  @override
  List<Object?> get props => [setLists];
}
