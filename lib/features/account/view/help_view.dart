import 'package:sr_ui/core/core.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "HELP",
      body: Center(
        child: Text("Account Detail"),
      ),
    );
  }
}
