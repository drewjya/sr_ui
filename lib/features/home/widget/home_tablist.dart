// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

final homeTabProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class HomeTabList extends ConsumerWidget {
  final TabController? controller;
  const HomeTabList({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      "Watchlist",
      "My Stocks",
      "Top Gainers",
      "Top Losers",
      "Top Volume"
    ];
    final onTap = (int index) =>
        ref.read(homeTabProvider.notifier).update((state) => index);

    return Container(
      padding: EdgeInsets.all(10.sp).copyWith(left: 20.sp, right: 20.sp),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        color: context.color.card,
      ),
      child: TabBar(
        onTap: onTap,
        dividerColor: AppColor.divider,
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        indicatorSize: TabBarIndicatorSize.tab,
        padding: EdgeInsets.all(0),
        labelPadding: EdgeInsets.symmetric(horizontal: 15.sp),
        tabs: items
            .map(
              (e) => Tab(text: e),
            )
            .toList(),
      ),
    );
  }
}
