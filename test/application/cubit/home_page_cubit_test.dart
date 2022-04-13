import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/application/cubit/home_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/set_list_repository.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

main() {
  const aSetList = SetList(1, 'name', 1);
  const userToken = 'userToken';

  final SetListRepository setListRepository = MockSetListRepository();
  final AuthenticationCubit _authenticationCubit = MockAuthenticationCubit();

  setUpAll(() {
    getIt.allowReassignment = true;
    getIt.registerSingleton(setListRepository);
  });

  blocTest<HomePageCubit, HomePageState>(
    'initial state is loading state',
    build: () => HomePageCubit(setListRepository, _authenticationCubit),
    verify: (cubit) => expect(
      cubit.state,
      isA<HomePageLoading>(),
    ),
  );

  blocTest<HomePageCubit, HomePageState>(
    'loads set list and emits new loaded state',
    build: () {
      when(() => setListRepository.getAllSetLists(userToken))
          .thenAnswer((_) async => right([aSetList]));
      return HomePageCubit(setListRepository, _authenticationCubit);
    },
    act: (cubit) => cubit.loadSetLists(userToken),
    expect: () => [
      HomePageLoaded(
        const [aSetList],
      )
    ],
  );

  blocTest<HomePageCubit, HomePageState>(
    'loads set list and emits new error state if api call errors',
    build: () {
      when(() => setListRepository.getAllSetLists(userToken))
          .thenAnswer((_) async => left(const Failure('error')));
      return HomePageCubit(setListRepository, _authenticationCubit);
    },
    act: (cubit) => cubit.loadSetLists(userToken),
    expect: () => [
      HomePageError(
        const Failure('error'),
      ),
    ],
  );
}
