part of 'pdf_page_cubit.dart';

abstract class PdfPageState extends Equatable {
  const PdfPageState();
}

class PdfPageLoading extends PdfPageState {
  @override
  List<Object> get props => [];
}

class PdfPageError extends PdfPageState {
  final Failure failure;

  const PdfPageError(this.failure);

  @override
  List<Object> get props => [failure];
}

class PdfPageLoaded extends PdfPageState {
  final Uri url;

  const PdfPageLoaded(this.url);

  @override
  List<Object> get props => [url];
}
