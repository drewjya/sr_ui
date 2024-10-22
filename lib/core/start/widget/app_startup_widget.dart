import 'package:sr_ui/core/core.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(goRouterProvider);

    return ThemeProvider(
      notifier: AppTheme(),
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: context.themeMode,
          );
        },
      ),
    );
  }
}

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartupProvider);

    ref.listen(
      appStartupProvider,
      (previous, next) {
        if (previous is AsyncLoading && next is AsyncData) {
          final pref = ref.read(sharedPrefrencesProvider).requireValue;
          ThemeProvider.of(context).init(pref);
          ref.router.push(Routes.splash);
        }
      },
    );
    return Scaffold(
      body: state.when(
        data: (data) {
          return const Center(
            child: Text("Oke"),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text("$error"),
          );
        },
        loading: () {
          return const Center(
            child: Text("Loading"),
          );
        },
      ),
    );
  }
}
