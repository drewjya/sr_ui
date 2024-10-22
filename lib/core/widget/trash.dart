import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/home/widget/home_appbar.dart';
import 'package:sr_ui/features/home/widget/home_tablist.dart';
import 'package:sr_ui/features/home/widget/porto_card/home_portofolio_card.dart';
import 'package:sr_ui/features/home/widget/watchlist_chips.dart';

class TrashHomeView extends HookWidget {
  const TrashHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final tabController = useTabController(initialLength: 5);
    log("Build ${DateTime.now()}");
    return NavScaffold(
      appBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: HomeAppbar(),
      ),
      backgroundWidget: Container(
        height: context.height,
        width: double.infinity,
        color: Colors.blue,
      ),
      body:  RefreshIndicator(
        onRefresh: () async {},
        child: Consumer(
          builder: (context, ref, child) {
            ref.listen(
              homeTabProvider,
              (previous, next) {
                scrollController.animateTo(0,
                    duration: Durations.medium1, curve: Curves.easeInOut);
              },
            );
            final item = ref.watch(homeTabProvider);
            return NestedScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              floatHeaderSlivers: false,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
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
                            color: context.color.backgroundCard,
                          )
                        },
                      ],
                    ),
                  ),
                ];
              },
              body: Container(
                color: Colors.transparent,
                child: TabBarView(
                    controller: tabController,
                    children: List.generate(
                      5,
                      (index) {
                        return Column(
                          children: [
                            VListTile(
                              // backgroundColor: context.color.error,
                              title: Text("Bayam $index",
                                  style: context.text.subtitle),
                              subtitle: VText(
                                "Ayam",
                                textStyle: context.text.subtitle,
                              ),
                            )
                          ],
                        );
                      },
                    )),
              ),
              // slivers: [
              //   SliverToBoxAdapter(
              //     child: HomePortfolioCard(
              //       controller: scrollController,
              //     ),
              //   ),
              //   SliverPinnedHeader(
              //       child: Column(
              //     children: [
              //       HomeTabList(
              //         controller: tabController,
              //       ),
              //       if (item == 0) ...{
              //         WatchlistChips(),
              //         Container(
              //           height: 10.sp,
              //           width: double.infinity,
              //           color: context.color.backgroundCard,
              //         )
              //       },
              //     ],
              //   )),
              //   SliverClip(
              //     child: DecoratedSliver(
              //       decoration: BoxDecoration(
              //         color: context.color.backgroundCard,
              //       ),
              //       sliver: SliverAnimatedSwitcher(
              //         child: [
              //           WatchlistTab(
              //             sliver: true,
              //           ),
              //           MyStocksTab(
              //             sliver: true,
              //           ),
              //           TopGainersTab(
              //             sliver: true,
              //           ),
              //           TopLosersTab(
              //             sliver: true,
              //           ),
              //           TopVolumeTab(
              //             // controller: scrollController,
              //             sliver: true,
              //           ),
              //         ][item],
              //         duration: Durations.medium2,
              //       ),
              //     ),
              //   ),
              // ],
            );
          },
        ),
      ),
      floatingActionButton: SizedBox.fromSize(
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
      ),
    );
  }
}
