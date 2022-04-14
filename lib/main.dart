import 'package:brick_app_v2/application/cubit/simple_bloc_observer.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:brick_app_v2/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () {
      configureDependencies();
      runApp(App());
    },
    storage: storage,
    blocObserver: SimpleBlocObserver(),
  );
}
