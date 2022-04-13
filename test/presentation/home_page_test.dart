import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/home_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

main() {
  const List<SetList> setLists = [SetList(1, 'name', 2), SetList(2, 'name', 3)];

  final cubit = MockHomePageCubit();
  final AppRouter _appRouter = AppRouter();

  Widget _createTestableWidget() {
    getIt.allowReassignment = true;
    getIt.registerSingleton<HomePageCubit>(cubit);

    _appRouter.push(const HomeRoute());

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }

  testWidgets(
    "does show one tile per set list",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<HomePageState>.empty(),
          initialState: HomePageLoaded(setLists));
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(Key('setListTile-${setLists[0].id}')), findsOneWidget);
      expect(find.byKey(Key('setListTile-${setLists[1].id}')), findsOneWidget);
    },
  );

  testWidgets(
    "navigates to set list page",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<HomePageState>.empty(),
          initialState: HomePageLoaded(setLists));
      await tester.pumpWidget(_createTestableWidget());

      await tester.tap(
        find.byKey(
          Key('setListTile-${setLists[1].id}'),
        ),
      );

      expect(_appRouter.current.name, SetListRoute.name);
      expect(
          (_appRouter.current.args as SetListRouteArgs).setList, setLists[1]);
    },
  );

  testWidgets(
    "does show loading spinner during loading",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<HomePageState>.empty(),
          initialState: HomePageLoading());
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(const Key('setListLoading')), findsOneWidget);
    },
  );

  testWidgets(
    "does show error if loading failed",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<HomePageState>.empty(),
          initialState: HomePageError(const Failure('message')));
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(const Key('setListError')), findsOneWidget);
    },
  );
}
