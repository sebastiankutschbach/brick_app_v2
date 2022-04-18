part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.loading() = HomePageLoading;
  const factory HomePageState.error(Failure failure) = HomePageError;
  const factory HomePageState.loaded(List<SetList> setLists) = HomePageLoaded;
}
