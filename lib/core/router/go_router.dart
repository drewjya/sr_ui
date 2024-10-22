import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sr_ui/core/core.dart';

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
      log("$state ${appStartupState.isLoading}");
      if (appStartupState.isLoading || appStartupState.hasError) {
        return Routes.startup;
      }
      log("${state.path} ${appStartupState.isLoading} SINI");
      return null;
      // return null;
      // return state.path;
    },
    routes: notifier,
  );
}
