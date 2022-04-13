// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    SetListRoute.name: (routeData) {
      final args = routeData.argsAs<SetListRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: SetListPage(args.setList, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(SettingsRoute.name, path: '/settings-page'),
        RouteConfig(SetListRoute.name, path: '/set-list-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [SetListPage]
class SetListRoute extends PageRouteInfo<SetListRouteArgs> {
  SetListRoute({required SetList setList, Key? key})
      : super(SetListRoute.name,
            path: '/set-list-page',
            args: SetListRouteArgs(setList: setList, key: key));

  static const String name = 'SetListRoute';
}

class SetListRouteArgs {
  const SetListRouteArgs({required this.setList, this.key});

  final SetList setList;

  final Key? key;

  @override
  String toString() {
    return 'SetListRouteArgs{setList: $setList, key: $key}';
  }
}
