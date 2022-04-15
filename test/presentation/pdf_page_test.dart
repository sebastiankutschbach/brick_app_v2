import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/pdf_page_cubit.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:brick_app_v2/presentation/pages/pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/moc_test.dart';
import '../mocks.dart';

main() {
  const String setNum = 'setNum';
  final PdfPageCubit pdfPageCubit = MockPdfPageCubit();

  _createTestableWidget() {
    getIt.allowReassignment = true;
    getIt.registerSingleton(pdfPageCubit);

    return MaterialApp(
      home: PdfPage(setNum, testMoc),
    );
  }

  testWidgets(
    'shows moc name in app bar',
    (WidgetTester tester) async {
      whenListen(pdfPageCubit, const Stream<PdfPageState>.empty(),
          initialState: PdfPageLoading());
      await tester.pumpWidget(_createTestableWidget());

      find.descendant(
          of: find.byType(AppBar), matching: find.text(testMoc.name));
    },
  );
}
