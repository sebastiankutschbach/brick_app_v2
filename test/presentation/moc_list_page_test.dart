import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/moc_list_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../domain/brick_set_test.dart';
import '../domain/moc_test.dart';
import '../mocks.dart';

main() {
  final List<Moc> mocs = [testMoc];
  final cubit = MockMocListPageCubit();
  final AppRouter appRouter = AppRouter();

  Widget _createTestableWidget() {
    getIt.allowReassignment = true;
    getIt.registerSingleton<MocListPageCubit>(cubit);

    when(() => cubit.loadMocList(testBrickSet.setNum))
        .thenAnswer((_) async => mocs);

    appRouter.replace(MocListRoute(set: testBrickSet));

    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }

  testWidgets(
    "does show one tile per moc that has build instructions",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<MocListPageState>.empty(),
          initialState: MocListPageLoaded(mocs));
      mocs.first.hasInstruction = true;
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(Key('mocCard-${mocs[0].mocNum}')), findsOneWidget);
    },
  );

  testWidgets(
    "does not show tile if moc has no build instruction",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<MocListPageState>.empty(),
          initialState: MocListPageLoaded(mocs));
      mocs.first.hasInstruction = false;
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(Key('mocCard-${mocs[0].mocNum}')), findsNothing);
    },
  );

  // testWidgets(
  //   "navigates to moc page",
  //   (WidgetTester tester) async {
  //     whenListen(cubit, const Stream<MocListPageState>.empty(),
  //         initialState: MocListPageLoaded(sets));
  //     await tester.pumpWidget(_createTestableWidget());

  //     await tester.tap(
  //       find.byKey(
  //         Key('setCard-${sets[0].setNum}'),
  //       ),
  //     );

  //     expect(_appRouter.current.name, MocListRoute.name);
  //     expect((_appRouter.current.args as MocListRouteArgs).set, sets[0]);
  //   },
  // );

  testWidgets(
    "does show loading spinner during loading",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<MocListPageState>.empty(),
          initialState: MocListPageLoading());
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(const Key('mocListLoading')), findsOneWidget);
    },
  );

  testWidgets(
    "does show error if loading failed",
    (WidgetTester tester) async {
      whenListen(cubit, const Stream<MocListPageState>.empty(),
          initialState: const MocListPageError(Failure('message')));
      await tester.pumpWidget(_createTestableWidget());

      expect(find.byKey(const Key('mocListError')), findsOneWidget);
    },
  );
}
