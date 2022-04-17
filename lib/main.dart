import 'dart:io';

import 'package:brick_app_v2/application/cubit/simple_bloc_observer.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:brick_app_v2/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () {
      configureDependencies();
      runApp(
        EasyLocalization(
            supportedLocales: const [Locale('en', ''), Locale('de', '')],
            path: 'assets/translations',
            startLocale: Locale(Platform.localeName.split('_')[0]),
            fallbackLocale: const Locale('en', ''),
            useFallbackTranslations: true,
            useOnlyLangCode: true,
            child: App()),
      );
    },
    storage: storage,
    blocObserver: SimpleBlocObserver(),
  );
}
