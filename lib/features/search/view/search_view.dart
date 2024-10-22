import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBasic(
      titleText: "SEARCH",
      body: CustomScrollView(
        slivers: [
          SliverPinnedHeader(
            child: Padding(
              padding: 20.horizontal.copyWith(bottom: 18.sp),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: 12.all,
                  isDense: true,
                  hintText: "Search for company or stock",
                  focusColor: Colors.white,
                  fillColor: Colors.transparent,
                ),
              ),
            ),
          ),
          SliverClip(
            child: SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp)
                    .copyWith(right: 12.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: VText(
                            "History",
                            textStyle: context.text.title.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            context.showBottomSheet(
                              constraints: BoxConstraints(),
                              builder: (context) => DraggableScrollableSheet(
                                  expand: false,
                                  maxChildSize: 0.4, // Half screen max height
                                  minChildSize:
                                      0.4, // Minimum when there's little content
                                  initialChildSize: 0.4,
                                  builder: (context, scrollController) {
                                    return DeleteSheet(
                                      message:
                                          "Do you really want to clear your\nhistory ?",
                                      onAccept: () {},
                                    );
                                  }),
                            );
                          },
                          label: Text("CLEAR"),
                          icon: Assets.icon.trash.svg(),
                        ),
                      ],
                    ),
                    Gap(15.sp)
                  ],
                ),
              ),
            ),
          ),
          SliverClip(
            child: SliverToBoxAdapter(
              child: Container(
                height: 60.sp,
                margin: EdgeInsets.only(
                  bottom: 12.sp,
                ),
                padding: 20.horizontal,
                child: ListView.separated(
                  padding: 0.all,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gap(10.sp),
                  itemBuilder: (context, index) {
                    return Button.card(
                      borderRadius: BorderRadius.circular(8),
                      child: VColumn(
                        children: [
                          Text(
                            "data",
                            style: context.text.title.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          VPriceChange(
                            hasRp: false,
                            price: 100,
                            percentage: 1.5,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverClip(
            child: SliverToBoxAdapter(
              child: Padding(
                padding: 20.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(18.sp),
                    VText(
                      "Trending Stocks",
                      textStyle: context.text.title.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverClip(
            child: SliverList.builder(
              itemBuilder: (context, index) {
                return SearchListTile(
                  onTap: () {},
                  stockCode: "BBCA",
                  companyName: "Digital Mediatama Maxima Tbk",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
