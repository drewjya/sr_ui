import 'package:sr_ui/core/core.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(Durations.medium1, () {
        log("Masuk");
        ref.router.go(Routes.login);
      });

      return () {
        log("Dispose");
      };
    }, []);

    return NavScaffold(
      body: Center(
        child: VText("Splash Screen"),
      ),
    );
  }
}
