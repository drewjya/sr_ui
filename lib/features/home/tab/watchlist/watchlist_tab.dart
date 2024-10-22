// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

part 'watchlist_empty.dart';

class WatchlistTab extends HookConsumerWidget {
  final bool sliver;
  final ScrollController? controller;
  const WatchlistTab({
    this.sliver = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return WatchlistEmpty();

    if (!sliver) {
      return AnimatedContainer(
        duration: Durations.short1,
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          itemCount: 20,
          itemBuilder: (context, index) {
            if (index == 19) {
              return Gap(60.sp);
            }
            return ItemListTile(
              stockCode: "BBCA",
              companyName: "Digital Mediatama Maxima Tbk",
              price: 6760,
              priceChange: 100,
              percentChange: 1.5,
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: context.divider,
            );
          },
        ),
      );
    }
    return SliverList.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == 19 ? 70 : .0),
          child: ItemListTile(
            onTap: () {
              ref.pushStock("BBCA");
            },
            stockCode: "BBCA",
            companyName: "Digital Mediatama Maxima Tbk",
            price: 6760,
            priceChange: 100,
            percentChange: 1.5,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: 20.horizontal,
          child: context.divider,
        );
      },
    );
  }
}
