import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sr_ui/core/router/route_path.dart';
import 'package:sr_ui/core/router/router_notifier.dart';
import 'package:sr_ui/core/start/provider/app_startup.dart';

part 'go_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GlobalKey<NavigatorState> spaceNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'space');

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final appStartupState = ref.watch(appStartupProvider);
  final notifier = ref.watch(routerNotifierProvider);
  return GoRouter(
    initialLocation: Routes.splash,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
        return Routes.startup;
      }
      return null;
    },
    routes: notifier,
  );
}
