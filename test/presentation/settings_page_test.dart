import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

main() {
  final cubit = MockSettingsCubit();
  final AppRouter _appRouter = AppRouter();

  Widget _createTestableWidget() {
    whenListen(cubit, const Stream<SettingsState>.empty(),
        initialState: const SettingsState(
            rebrickableUsername: '',
            rebrickablePassword: '',
            rebrickableApiKey: ''));
    _appRouter.push(const SettingsRoute());

    return BlocProvider<SettingsCubit>(
      create: (context) => cubit,
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }

  testWidgets(
    "does show an entry for username",
    (WidgetTester tester) async {
      await tester.pumpWidget(_createTestableWidget());
      expect(find.byKey(const Key('rebrickableUsername')), findsOneWidget);
    },
  );

  testWidgets(
    "does show input dialog when clicking on the username",
    (WidgetTester tester) async {
      await tester.pumpWidget(_createTestableWidget());
      await tester.tap(find.byKey(const Key('rebrickableUsername')));

      await tester.pump();

      expect(find.byKey(const Key('textInputDialog')), findsOneWidget);
    },
  );

  testWidgets(
    "does show an entry for password",
    (WidgetTester tester) async {
      await tester.pumpWidget(_createTestableWidget());
      expect(find.byKey(const Key('rebrickablePassword')), findsOneWidget);
    },
  );

  testWidgets(
    "does show input dialog when clicking on the password",
    (WidgetTester tester) async {
      await tester.pumpWidget(_createTestableWidget());
      await tester.tap(find.byKey(const Key('rebrickablePassword')));

      await tester.pump();

      expect(find.byKey(const Key('textInputDialog')), findsOneWidget);
    },
  );

  testWidgets(
    "does show an entry for api key",
    (WidgetTester tester) async {
      await tester.pumpWidget(_createTestableWidget());
      expect(find.byKey(const Key('rebrickableApiKey')), findsOneWidget);
    },
  );

  testWidgets(
    "does show input dialog when clicking on the api key",
    (WidgetTester tester) async {
      await tester.pumpWidget(_createTestableWidget());
      await tester.tap(find.byKey(const Key('rebrickableApiKey')));

      await tester.pump();

      expect(find.byKey(const Key('textInputDialog')), findsOneWidget);
    },
  );
}
