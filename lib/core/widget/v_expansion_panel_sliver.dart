// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';

class VExpansionPanelSliver extends HookWidget {
  final bool expanded;
  final String title;
  final List<String> items;
  final bool pinned;
  final double? gap;
  final VoidCallback? onTap;
  const VExpansionPanelSliver({
    this.expanded = true,
    required this.title,
    this.items = const [],
    this.pinned = false,
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
    final header = GestureDetector(
      onTap: onTap,
      child: Container(
        color: context.color.background,
        padding: EdgeInsets.only(bottom: 15.sp),
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
    );
    return SliverMainAxisGroup(
      slivers: [
        if (pinned)
          SliverPinnedHeader(child: header)
        else
          SliverToBoxAdapter(
            child: header,
          ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizeTransition(
                sizeFactor: animation,
                child: VColumn(
                  gap: Gap(15.sp),
                  children: items
                      .map(
                        (e) => ItemList(title: e),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        SliverPinnedHeader(
          child: Gap((gap ?? 15).sp),
        )
      ],
    );
  }
}
