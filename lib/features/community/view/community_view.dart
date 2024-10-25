import 'package:sr_ui/core/core.dart';

class CommunityView extends HookConsumerWidget {
  const CommunityView({super.key});

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
              tabs: ["BERITA", "ARTIKEL"]
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
                  child: VText("BERITA"),
                ),
                Center(
                  child: VText("ARTIKEL"),
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
