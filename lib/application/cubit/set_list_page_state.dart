part of 'set_list_page_cubit.dart';

@freezed
class SetListPageState with _$SetListPageState {
  const factory SetListPageState.loading() = SetListPageLoading;
  const factory SetListPageState.error(Failure failure) = SetListPageError;
  const factory SetListPageState.loaded(List<BrickSet> sets) =
      SetListPageLoaded;
}
