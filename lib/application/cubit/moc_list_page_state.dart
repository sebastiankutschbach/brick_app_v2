part of 'moc_list_page_cubit.dart';

@freezed
class MocListPageState with _$MocListPageState {
  const factory MocListPageState.loading() = MocListPageLoading;
  const factory MocListPageState.error(Failure failure) = MocListPageError;
  const factory MocListPageState.loaded(List<Moc> mocs) = MocListPageLoaded;
}
