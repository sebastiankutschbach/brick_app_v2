part of 'pdf_page_cubit.dart';

@freezed
class PdfPageState with _$PdfPageState {
  const factory PdfPageState.loading() = PdfPageLoading;
  const factory PdfPageState.error(Failure failure) = PdfPageError;
  const factory PdfPageState.loaded(Uri url) = PdfPageLoaded;
}
