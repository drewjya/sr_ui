import 'package:sr_ui/core/core.dart';

class ShareCuanView extends HookConsumerWidget {
  const ShareCuanView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBasic(
      titleText: "SHARE CUAN",
      onBack: () => ref.pop(),
      body: Column(
        children: [],
      ),
    );
  }
}
