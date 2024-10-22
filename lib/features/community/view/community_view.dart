import 'package:sr_ui/core/core.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Center(
        child: VText(
          "Community Page",
          textStyle: context.text.title,
        ),
      ),
    );
  }
}
