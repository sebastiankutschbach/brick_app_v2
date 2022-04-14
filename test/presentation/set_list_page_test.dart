import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/set_list_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

main() {
  const SetList setList = SetList(1, 'name', 2);
  final List<Set> sets = [Set.fromJson(set1Json), Set.fromJson(set2Json)];

  final cubit = MockSetListPageCubit();
  final AppRouter _appRouter = AppRouter();

  Widget _createTestableWidget() {
    getIt.allowReassignment = true;
    getIt.registerSingleton<SetListPageCubit>(cubit);

    when(() => cubit.loadSetList(setList.id)).thenAnswer((_) async => sets);

    _appRouter.replace(SetListRoute(setList: setList));

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }

  testWidgets(
    "does show one tile per set list",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<SetListPageState>.empty(),
          initialState: SetListPageLoaded(sets));
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(Key('setTile-${sets[0].setNum}')), findsOneWidget);
      expect(find.byKey(Key('setTile-${sets[1].setNum}')), findsOneWidget);
    },
  );

  // testWidgets(
  //   "navigates to set list page",
  //   (WidgetTester tester) async {
  //     whenListen(cubit, const Stream<HomePageState>.empty(),
  //         initialState: HomePageLoaded(setLists));
  //     await tester.pumpWidget(_createTestableWidget());

  //     await tester.tap(
  //       find.byKey(
  //         Key('setListTile-${setLists[1].id}'),
  //       ),
  //     );

  //     expect(_appRouter.current.name, SetListRoute.name);
  //     expect(
  //         (_appRouter.current.args as SetListRouteArgs).setList, setLists[1]);
  //   },
  // );

  testWidgets(
    "does show loading spinner during loading",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<SetListPageState>.empty(),
          initialState: SetListPageLoading());
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(const Key('setListLoading')), findsOneWidget);
    },
  );

  testWidgets(
    "does show error if loading failed",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<SetListPageState>.empty(),
          initialState: const SetListPageError(Failure('message')));
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(const Key('setListError')), findsOneWidget);
    },
  );
}

final set1Json = {
  "set_num": "31058-1",
  "name": "Mighty Dinosaurs",
  "year": 2017,
  "theme_id": 672,
  "num_parts": 174,
  "set_img_url": "https://cdn.rebrickable.com/media/sets/31058-1/30803.jpg",
  "set_url": "https://rebrickable.com/sets/31058-1/mighty-dinosaurs/",
  "last_modified_dt": "2021-09-03T04:27:39.904512Z"
};

final set2Json = {
  "set_num": "31032-1",
  "name": "Red Creatures",
  "year": 2015,
  "theme_id": 672,
  "num_parts": 221,
  "set_img_url": "https://cdn.rebrickable.com/media/sets/31032-1/13188.jpg",
  "set_url": "https://rebrickable.com/sets/31032-1/red-creatures/",
  "last_modified_dt": "2018-11-29T04:57:15.213112Z"
};
