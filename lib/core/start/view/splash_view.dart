import 'package:sr_ui/core/core.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(
        Durations.medium1,
        () {
          ref.router.go(Routes.home);
        },
      );

      return;
    }, []);

    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
