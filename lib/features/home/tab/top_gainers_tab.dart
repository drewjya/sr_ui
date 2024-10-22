// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class TopGainersTab extends HookConsumerWidget {
  final bool sliver;
  final ScrollController? controller;
  const TopGainersTab({
    this.sliver = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!sliver) {
      return AnimatedContainer(
        color: context.color.backgroundCard,
        duration: Durations.short1,
        child: ListView.separated(
          controller: controller,
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
            stockCode: "BBCA",
            companyName: "Digital Mediatama Maxima Tbk",
            price: 6760,
            priceChange: 100,
            percentChange: 1.5,
            onTap: () {},
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Padding(padding: 20.horizontal, child: context.divider);
      },
    );
  }
}
