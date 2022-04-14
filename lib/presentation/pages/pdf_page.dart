import 'package:brick_app_v2/application/cubit/pdf_page_cubit.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  final String setNum;
  final Moc moc;
  const PdfPage(this.setNum, this.moc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PdfPageCubit>()..getPdfUrl(setNum, moc.mocNum),
      child: BlocBuilder<PdfPageCubit, PdfPageState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: Text(moc.name)),
              body: _bodyFrom(context, state));
        },
      ),
    );
  }

  _bodyFrom(BuildContext context, PdfPageState state) {
    switch (state.runtimeType) {
      case PdfPageLoading:
        return _loadingBody(context, state as PdfPageLoading);
      case PdfPageError:
        return _errorBody(context, state as PdfPageError);
      case PdfPageLoaded:
        return _loadedBody(context, state as PdfPageLoaded);
    }
  }

  _loadingBody(BuildContext context, PdfPageLoading state) {
    return const Center(
        key: Key('pdfLoading'), child: CircularProgressIndicator());
  }

  _errorBody(BuildContext context, PdfPageError state) {
    return Center(
      key: const Key('pdfError'),
      child: Text(
          'There was an error while loading your PDF: ${state.failure.message}'),
    );
  }

  _loadedBody(BuildContext context, PdfPageLoaded state) {
    return SfPdfViewer.network(
      state.url.toString(),
      canShowScrollHead: false,
    );
  }
}
