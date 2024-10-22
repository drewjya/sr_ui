import 'package:sr_ui/core/core.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "ACCOUNT",
      body: Center(
        child: VText("PRofile"),
      ),
    );
  }
}
