// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VExpansionPanel extends HookWidget {
  final bool expanded;
  final String title;
  final List<String> items;
  final double? gap;
  final VoidCallback? onTap;
  const VExpansionPanel({
    this.expanded = true,
    required this.title,
    this.items = const [],
    this.gap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: Durations.short3);
    final animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    useEffect(() {
      if (expanded) {
        controller.forward();
      } else {
        controller.reverse();
      }
      return null;
    }, [expanded]);
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VText(
                      title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    VText(
                      "${items.length} steps",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: context.color.grey,
                    ),
                  ],
                )),
                AnimatedRotation(
                  duration: Durations.short3,
                  turns: expanded ? 0.25 : 0.75,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(15.sp),
        SizeTransition(
          sizeFactor: animation,
          child: VColumn(
            gap: Gap(15.sp),
            children: items
                .map(
                  (e) => ItemList(text: e),
                )
                .toList(),
          ),
        ),
        Gap((gap ?? 15).sp),
      ],
    );
  }
}
