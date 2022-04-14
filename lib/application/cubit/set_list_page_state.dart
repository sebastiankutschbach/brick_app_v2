part of 'set_list_page_cubit.dart';

abstract class SetListPageState extends Equatable {
  const SetListPageState();
}

class SetListPageLoading extends SetListPageState {
  @override
  List<Object> get props => [];
}

class SetListPageError extends SetListPageState {
  final Failure failure;

  const SetListPageError(this.failure);

  @override
  List<Object> get props => [failure];
}

class SetListPageLoaded extends SetListPageState {
  final List<BrickSet> sets;

  const SetListPageLoaded(this.sets);

  @override
  List<Object> get props => [sets];
}
