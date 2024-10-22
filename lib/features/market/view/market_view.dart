import 'package:sr_ui/core/core.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Center(
        child: VText(
          "Market Page",
          style: context.text.title,
        ),
      ),
    );
  }
}
