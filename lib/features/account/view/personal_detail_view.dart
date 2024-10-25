import 'package:sr_ui/core/core.dart';

class PersonalDetailView extends StatelessWidget {
  const PersonalDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "PERSONAL DETAILS",
      body: Center(
        child: Text("Account Detail"),
      ),
    );
  }
}
