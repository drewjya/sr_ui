import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/order/view/tab/order_status_tab.dart';

class OrderView extends HookConsumerWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 4);
    return NavScaffold(
      body: Column(
        children: [
          TabBar(
              controller: tabController,
              padding: EdgeInsets.all(0),
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.symmetric(horizontal: 15.sp),
              tabs: ["ORDER STATUS", "AUTO ORDER", "GTC LIST", "TRADE DONE"]
                  .map(
                    (e) => Tab(
                      text: e,
                    ),
                  )
                  .toList()),
          Expanded(
            child: TabBarView(
              children: [
                OrderStatusTab(),
                Center(
                  child: VText("Auto Order"),
                ),
                Center(
                  child: VText("gtc list"),
                ),
                Center(
                  child: VText("trade done"),
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
