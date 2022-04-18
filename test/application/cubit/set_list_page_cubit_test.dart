import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/application/cubit/set_list_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/set_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../presentation/set_list_page_test.dart';

main() {
  const String userToken = 'userToken';
  const int setListId = 1;
  const Failure failure = Failure('429');

  final AuthenticationCubit authenticationCubit = MockAuthenticationCubit();
  final SetListRepositoryFacade setListRepository = MockSetListRepository();

  setUpAll(() {
    when(() => authenticationCubit.userToken)
        .thenAnswer((_) async => right(userToken));
  });

  blocTest<SetListPageCubit, SetListPageState>(
    'initial state is loading',
    build: () => SetListPageCubit(setListRepository, authenticationCubit),
    verify: (cubit) => expect(cubit.state is SetListPageLoading, true),
  );

  blocTest<SetListPageCubit, SetListPageState>(
    'loading the set list emits first loading state and loaded state afterwards',
    build: () {
      when(() => setListRepository.getSetList(userToken, setListId))
          .thenAnswer((_) async => right(sets));
      return SetListPageCubit(setListRepository, authenticationCubit);
    },
    act: (cubit) => cubit.loadSetList(setListId),
    expect: () => [const SetListPageLoading(), SetListPageLoaded(sets)],
  );

  blocTest<SetListPageCubit, SetListPageState>(
    'loading the set list emits first loading state and error state afterwards if loading fails',
    build: () {
      when(() => setListRepository.getSetList(userToken, setListId))
          .thenAnswer((_) async => left(failure));
      return SetListPageCubit(setListRepository, authenticationCubit);
    },
    act: (cubit) => cubit.loadSetList(setListId),
    expect: () => [const SetListPageLoading(), const SetListPageError(failure)],
  );
}
