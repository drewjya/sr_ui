import 'package:sr_ui/core/core.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return VDrawer(
      titleText: "ACCOUNT",
      body: Center(
        child: VText("PRofile"),
      ),
    );
  }
}
