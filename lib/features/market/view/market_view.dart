import 'package:sr_ui/core/core.dart';

class MarketView extends HookConsumerWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    return NavScaffold(
      body: Column(
        children: [
          TabBar(
              controller: tabController,
              padding: EdgeInsets.all(0),
              dividerColor: AppColor.divider,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.symmetric(horizontal: 15.sp),
              tabs: ["E-IPO", "KATALOG"]
                  .map(
                    (e) => Tab(
                      text: e,
                    ),
                  )
                  .toList()),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: VText("E-IPO"),
                ),
                Center(
                  child: VText("Market"),
                ),
              ],
              controller: tabController,
            ),
          ),
        ],
      ),
    );
  }
}
