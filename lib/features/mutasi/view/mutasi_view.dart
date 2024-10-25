import 'package:sr_ui/core/core.dart';

class MutasiView extends HookConsumerWidget {
  const MutasiView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBasic(
      titleText: "MUTASI",
      onBack: () => ref.pop(),
      body: Column(
        children: [],
      ),
    );
  }
}
