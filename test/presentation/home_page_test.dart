import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/home_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:brick_app_v2/i18n/string.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

main() {
  const List<SetList> setLists = [SetList(1, 'name', 2), SetList(2, 'name', 3)];

  late HomePageCubit cubit = MockHomePageCubit();
  final AppRouter appRouter = AppRouter();

  Widget _createTestableWidget() {
    getIt.allowReassignment = true;
    getIt.registerSingleton<HomePageCubit>(cubit);
    when(() => cubit.loadSetLists()).thenAnswer((_) async => []);

    appRouter.replace(const HomeRoute());

    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
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

      expect(appRouter.current.name, SetListRoute.name);
      expect((appRouter.current.args as SetListRouteArgs).setList, setLists[1]);
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

  testWidgets(
    "does show material banner if credentials are missing",
    (WidgetTester tester) async {
      whenListen(
          cubit,
          Stream.fromIterable(
              [HomePageError(const CredentialsMissingFailure('message'))]),
          initialState: HomePageLoading());
      await tester.pumpWidget(_createTestableWidget());

      await tester.pumpAndSettle();

      expect(
          find.descendant(
              of: find.byType(MaterialBanner),
              matching: find.text(t.errMsgMissingCredentials)),
          findsOneWidget);
    },
  );

  testWidgets(
    "does show material banner if credentials are wrong",
    (WidgetTester tester) async {
      whenListen(
          cubit,
          Stream.fromIterable(
              [HomePageError(const WrongCredentialsFailure('message'))]),
          initialState: HomePageLoading());
      await tester.pumpWidget(_createTestableWidget());

      await tester.pumpAndSettle();

      expect(
          find.descendant(
              of: find.byType(MaterialBanner),
              matching: find.text(t.errMsgWrongCredentials)),
          findsOneWidget);
    },
  );
}
