import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:brick_app_v2/i18n/string.g.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthenticationCubit>(),
      child: BlocProvider<SettingsCubit>(
        create: (context) => getIt<SettingsCubit>(),
        child: MaterialApp.router(
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: LocaleSettings.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
