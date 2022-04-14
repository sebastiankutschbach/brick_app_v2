import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/moc_list_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/brick_set_repository.dart';
import 'package:brick_app_v2/infrastructure/moc_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/moc_test.dart';
import '../../mocks.dart';

main() {
  const String setNum = '1';
  const Failure failure = Failure('429');

  final BrickSetRepositoryFacade _brickSetRepository = MockBrickSetRepository();
  final MocRepositoryFacade _mocRepository = MockMocRepository();

  blocTest<MocListPageCubit, MocListPageState>(
    'initial state is loading',
    build: () => MocListPageCubit(_brickSetRepository, _mocRepository),
    verify: (cubit) => expect(cubit.state is MocListPageLoading, true),
  );

  blocTest<MocListPageCubit, MocListPageState>(
    'loading the set list emits first loading state and loaded state afterwards',
    build: () {
      when(() => _brickSetRepository.loadMocs(setNum: setNum))
          .thenAnswer((_) async => right([testMoc]));
      when(() => _mocRepository.areBuildInstructionsAvailable(
          setNum: setNum,
          mocNums: [testMoc.mocNum])).thenAnswer((_) async => [testMoc.mocNum]);
      return MocListPageCubit(_brickSetRepository, _mocRepository);
    },
    act: (cubit) => cubit.loadMocList(setNum),
    expect: () => [
      MocListPageLoading(),
      MocListPageLoaded([testMoc])
    ],
  );

  blocTest<MocListPageCubit, MocListPageState>(
    'loading the set list emits first loading state and error state afterwards if loading fails',
    build: () {
      when(() => _brickSetRepository.loadMocs(setNum: setNum))
          .thenAnswer((_) async => left(failure));
      return MocListPageCubit(_brickSetRepository, _mocRepository);
    },
    act: (cubit) => cubit.loadMocList(setNum),
    expect: () => [MocListPageLoading(), const MocListPageError(failure)],
  );
}
