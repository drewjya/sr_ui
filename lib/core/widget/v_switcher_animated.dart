// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VSwitcherAnimated extends StatelessWidget {
  final bool expanded;
  final Widget child;

  const VSwitcherAnimated({
    Key? key,
    required this.expanded,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Durations.short1,
      child: expanded
          ? Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.sp,
                horizontal: 20.sp,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: VText(
                      "Daily",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: VText(
                      "Daily",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: child,
        );
      },
    );
  }
}
