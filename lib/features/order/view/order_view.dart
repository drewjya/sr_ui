import 'package:sr_ui/core/core.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Center(
        child: VText(
          "Order Page",
          textStyle: context.text.title,
        ),
      ),
    );
  }
}
