import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/application/cubit/set_list_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/set_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../presentation/set_list_page_test.dart';

main() {
  const String userToken = 'userToken';
  const int setListId = 1;
  const Failure failure = Failure('429');

  final AuthenticationCubit _authenticationCubit = MockAuthenticationCubit();
  final SetListRepository _setListRepository = MockSetListRepository();

  setUpAll(() {
    when(() => _authenticationCubit.userToken)
        .thenAnswer((_) async => right(userToken));
  });

  blocTest<SetListPageCubit, SetListPageState>(
    'initial state is loading',
    build: () => SetListPageCubit(_setListRepository, _authenticationCubit),
    verify: (cubit) => expect(cubit.state is SetListPageLoading, true),
  );

  blocTest<SetListPageCubit, SetListPageState>(
    'loading the set list emits first loading state and loaded state afterwards',
    build: () {
      when(() => _setListRepository.getSetList(userToken, setListId))
          .thenAnswer((_) async => right(sets));
      return SetListPageCubit(_setListRepository, _authenticationCubit);
    },
    act: (cubit) => cubit.loadSetList(setListId),
    expect: () => [SetListPageLoading(), SetListPageLoaded(sets)],
  );

  blocTest<SetListPageCubit, SetListPageState>(
    'loading the set list emits first loading state and error state afterwards if loading fails',
    build: () {
      when(() => _setListRepository.getSetList(userToken, setListId))
          .thenAnswer((_) async => left(failure));
      return SetListPageCubit(_setListRepository, _authenticationCubit);
    },
    act: (cubit) => cubit.loadSetList(setListId),
    expect: () => [SetListPageLoading(), const SetListPageError(failure)],
  );
}
