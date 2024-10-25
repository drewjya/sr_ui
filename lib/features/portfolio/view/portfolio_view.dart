// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/portfolio/tab/tab.dart';
import 'package:sr_ui/features/portfolio/widget/portofolio_card.dart';
import 'package:sr_ui/features/portfolio/widget/realized_return_action.dart';

class PortfolioView extends HookConsumerWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(0);
    final tabController = useTabController(initialLength: 2);
    return ScaffoldBasic(
      titleText: "PORTFOLIO",
      actions: [
        IconButton(
          onPressed: () => ref.router.push(Routes.shareCuan),
          icon: Assets.icon.share.svg(),
        ),
      ],
      background: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: context.height * 0.5,
          width: double.infinity,
          color: context.color.card,
        ),
      ),
      onBack: () => ref.pop(),
      body: RefreshIndicator(
        onRefresh: () async => {},
        child: CustomScrollView(
          slivers: [
            SliverPinnedHeader(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
                    child: PortfolioCard(),
                  ),
                  Gap(20.sp),
                  Container(
                    child: Container(
                      padding: 20.horizontal,
                      height: 42.sp,
                      child: TabBar(
                        dividerColor: AppColor.divider,
                        controller: tabController,
                        onTap: (value) {
                          selected.value = value;
                        },
                        padding: EdgeInsets.all(0),
                        tabAlignment: TabAlignment.fill,
                        dividerHeight: 2,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            text: "Portfolio",
                          ),
                          Tab(
                            text: "Realized Return",
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(20),
                      ),
                      color: context.color.card,
                    ),
                    padding: EdgeInsets.only(top: 10.sp),
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            if (selected.value == 1)
              DecoratedSliver(
                decoration: BoxDecoration(
                  color: context.color.card,
                ),
                sliver: SliverPinnedHeader(
                  child: RealizedReturnAction(),
                ),
              ),
            SliverClip(
              child: DecoratedSliver(
                decoration: BoxDecoration(
                  color: context.color.card,
                ),
                sliver: SliverAnimatedSwitcher(
                  child: [
                    PortfolioTab(),
                    RealizedReturnTab(),
                  ][selected.value],
                  duration: Durations.medium1,
                ),
              ),
            ),
            DecoratedSliver(
              decoration: BoxDecoration(
                color: context.color.card,
              ),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
