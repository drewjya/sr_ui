import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sr_ui/core/start/provider/shared_preferences.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
FutureOr<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    ref.invalidate(sharedPrefrencesProvider);
  });
  await ref.watch(sharedPrefrencesProvider.future);
  return;
}
