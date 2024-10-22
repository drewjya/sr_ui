import 'package:sr_ui/core/core.dart';

extension WidgetRefExt on WidgetRef {
  void showLoading() => read(goRouterProvider).push(Routes.loadingDialog);

  void pop() => read(goRouterProvider).pop();
  GoRouter get router => read(goRouterProvider);
  // AuthState get auth => read(authProvider);

  // AuthState get authListen => watch(authProvider);
  // XTheme get theme => watch(vthemeProvider);

  void pushStock(String stockCode) =>
      read(goRouterProvider).push(Routes.goToDetailStock(stockCode));
}

extension RefExt on Ref {
  void showLoading() => read(goRouterProvider).push(Routes.loadingDialog);

  void pushStock(String stockCode) =>
      read(goRouterProvider).push(Routes.goToDetailStock(stockCode));
  void pop() {
    final goRouter = read(goRouterProvider);
    if (goRouter.canPop()) {
      read(goRouterProvider).pop();
    }
  }

  GoRouter get router => read(goRouterProvider);

  // AuthState get auth => read(authProvider);

  // AuthState get authListen => watch(authProvider);

  // T authSelect<T>(T Function(AuthState) select) =>
  //     watch(authProvider.select(select));
}
