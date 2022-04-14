part of 'moc_list_page_cubit.dart';

abstract class MocListPageState extends Equatable {
  const MocListPageState();
}

class MocListPageLoading extends MocListPageState {
  @override
  List<Object> get props => [];
}

class MocListPageError extends MocListPageState {
  final Failure failure;

  const MocListPageError(this.failure);

  @override
  List<Object> get props => [failure];
}

class MocListPageLoaded extends MocListPageState {
  final List<Moc> mocs;

  const MocListPageLoaded(this.mocs);

  @override
  List<Object> get props => [mocs];
}
