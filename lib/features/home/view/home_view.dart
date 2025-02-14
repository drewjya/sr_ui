import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/home/tab/tab.dart';
import 'package:sr_ui/features/home/widget/home_appbar.dart';
import 'package:sr_ui/features/home/widget/home_tablist.dart';
import 'package:sr_ui/features/home/widget/porto_card/home_portofolio_card.dart';
import 'package:sr_ui/features/home/widget/watchlist_chips.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final tabController = useTabController(initialLength: 5);
    ref.listen(
      homeTabProvider,
      (previous, next) {
        scrollController.animateTo(0,
            duration: Durations.medium1, curve: Curves.easeInOut);
      },
    );

    return NavScaffold(
      appBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: HomeAppbar(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Consumer(
          builder: (context, ref, child) {
            final item = ref.watch(homeTabProvider);
            return CustomScrollView(
              controller: scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: HomePortfolioCard(
                    controller: scrollController,
                  ),
                ),
                SliverPinnedHeader(
                    child: Column(
                  children: [
                    HomeTabList(
                      controller: tabController,
                    ),
                    if (item == 0) ...{
                      WatchlistChips(),
                      Container(
                        height: 10.sp,
                        width: double.infinity,
                        color: context.color.card,
                      )
                    },
                  ],
                )),
                SliverClip(
                  child: DecoratedSliver(
                    decoration: BoxDecoration(
                      color: context.color.card,
                    ),
                    sliver: SliverAnimatedSwitcher(
                      child: [
                        WatchlistTab(
                          sliver: true,
                        ),
                        MyStocksTab(
                          sliver: true,
                        ),
                        TopGainersTab(
                          sliver: true,
                        ),
                        TopLosersTab(
                          sliver: true,
                        ),
                        TopVolumeTab(
                          // controller: scrollController,
                          sliver: true,
                        ),
                      ][item],
                      duration: Durations.medium2,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Builder(builder: (context) {
        return SizedBox.fromSize(
          size: Size.square(55.sp),
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: "asjasjs",
              backgroundColor: context.color.primary,
              elevation: 0,
              onPressed: () {},
              child: VSvg(
                svg: Assets.icon.groupChat,
                color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
