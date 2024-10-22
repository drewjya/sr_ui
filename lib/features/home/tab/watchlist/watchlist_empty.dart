part of 'watchlist_tab.dart';

class WatchlistEmpty extends StatelessWidget {
  const WatchlistEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Gap(20.sp),
          BackgroundIconSvg(
            size: 120.sp,
            asset: Assets.icon.emptyWatchlist,
            padding: 15.sp,
          ),
          Gap(20.sp),
          Column(
            children: [
              VText(
                "This watchlist is empty",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              Gap(4.sp),
              SizedBox(
                width: 0.7 * context.width,
                child: VText(
                  "Stay updated on price changes by adding your favorite securities to this watchlist.",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: context.color.grey,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(15.sp),
              TextButton.icon(
                onPressed: () {},
                label: Text("ADD TO WATCHLIST"),
                icon: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
