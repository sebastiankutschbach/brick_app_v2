import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/pdf_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/moc_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

main() {
  const setNum = 'setNum';
  const mocNum = 'mocNum';
  const failure = Failure('');

  final Uri url = Uri.parse('www.google.de');
  final MocRepositoryFacade mocRepository = MockMocRepository();

  blocTest<PdfPageCubit, PdfPageState>('initial state is loading state',
      build: () => PdfPageCubit(mocRepository),
      verify: (cubit) => expect(cubit.state is PdfPageLoading, true));

  blocTest<PdfPageCubit, PdfPageState>(
      'getPdf emits loading state and loaded state on sucessful load',
      build: () {
        when(() => mocRepository.getBuildInstructionUrl(
            setNum: setNum,
            mocNum: mocNum)).thenAnswer((invocation) async => right(url));
        return PdfPageCubit(mocRepository);
      },
      act: (cubit) => cubit.getPdfUrl(setNum, mocNum),
      expect: () => [const PdfPageLoading(), PdfPageLoaded(url)]);

  blocTest<PdfPageCubit, PdfPageState>(
      'getPdf emits loading state and error state on failed load',
      build: () {
        when(() => mocRepository.getBuildInstructionUrl(
            setNum: setNum,
            mocNum: mocNum)).thenAnswer((invocation) async => left(failure));
        return PdfPageCubit(mocRepository);
      },
      act: (cubit) => cubit.getPdfUrl(setNum, mocNum),
      expect: () => [const PdfPageLoading(), const PdfPageError(failure)]);
}
