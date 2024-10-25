import 'package:sr_ui/core/core.dart';

class BankAccountView extends StatelessWidget {
  const BankAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "MANAGE BANK ACCOUNT",
      body: Center(
        child: Text("Account Detail"),
      ),
    );
  }
}
