import 'package:brick_app_v2/domain/brick_set.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/presentation/pages/moc_list_page.dart';
import 'package:brick_app_v2/presentation/pages/pdf_page.dart';
import 'package:brick_app_v2/presentation/pages/setttings_page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:brick_app_v2/presentation/pages/home_page.dart';
import 'package:brick_app_v2/presentation/pages/set_list_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: SetListPage),
    AutoRoute(page: MocListPage),
    AutoRoute(page: PdfPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
