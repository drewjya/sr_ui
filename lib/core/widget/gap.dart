import 'package:sr_ui/core/core.dart';

class Gap extends StatelessWidget {
  final double gap;
  const Gap(this.gap, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: gap,);
  }
}
