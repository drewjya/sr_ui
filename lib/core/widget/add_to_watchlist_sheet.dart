// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';

class AddToWatchlistSheet extends StatelessWidget {
  final ScrollController controller;
  const AddToWatchlistSheet({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverPinnedHeader(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.color.backgroundCard,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VText(
                        "Save stocks to",
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                      ),
                      Gap(15.sp),
                    ],
                  ),
                ),
              ),
              SliverClip(
                child: DecoratedSliver(
                  decoration: BoxDecoration(
                    color: context.color.backgroundCard,
                  ),
                  sliver: SliverList.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => Gap(10.sp),
                    itemBuilder: (context, index) {
                      bool bookmark = false;
                      return StatefulBuilder(builder: (context, setState) {
                        return WatchlistTile(
                          backgroundColor: context.color.backgroundCard,
                          stockCode: "Wathclist 1",
                          companyName: "21 stocks",
                          trailing: Button.secondary(
                            onTap: () {
                              setState(() {
                                bookmark = !bookmark;
                              });
                            },
                            backgroundColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            child: AnimatedSwitcher(
                              duration: Durations.medium1,
                              child: bookmark
                                  ? Assets.icon.bookmark.svg()
                                  : Assets.icon.noBookmark.svg(),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: context.color.backgroundCard,
          padding: EdgeInsets.symmetric(
            horizontal: 15.sp,
            vertical: 15.sp,
          ),
          width: double.infinity,
          child: VColumn(
            gap: Gap(10.sp),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  "ADD NEW WATCHLIST",
                ),
                icon: Icon(Icons.add),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Text("SAVE"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
