import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/topup/widget/widget.dart';

class TopUpView extends ConsumerWidget {
  const TopUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBasic(
      titleText: "TOP UP",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: 20.horizontal,
              child: TopUpCard(),
            ),
            Gap(30.sp),
            TopUpRegisteredBank(),
            Gap(30.sp),
            Padding(
              padding: 20.horizontal,
              child: PaymentMethod(),
            ),
          ],
        ),
      ),
    );
  }
}
