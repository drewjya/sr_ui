// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class NavScaffold extends StatelessWidget {
  final Widget? backgroundWidget;
  final Widget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  const NavScaffold({
    Key? key,
    this.backgroundWidget,
    this.appBar,
    required this.body,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      body: Container(
        color: context.color.background,
        child: Stack(
          children: [
            Container(
              height: context.height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.color.primary.withOpacity(0.6),
                    context.color.primary.withOpacity(0),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            if (backgroundWidget != null) backgroundWidget!,
            Padding(
              padding: EdgeInsets.only(top: context.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (appBar != null) appBar!,
                  Expanded(child: body),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
