import 'package:sr_ui/core/core.dart';

class PortfolioTab extends StatelessWidget {
  const PortfolioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final emptyWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BackgroundIconSvg(
          size: 120.sp,
          asset: Assets.icon.portfolioEmpty,
          padding: 20.sp,
          colors: [
            context.color.primary.withOpacity(0.3),
            context.color.primary.withOpacity(0.0),
          ],
        ),
        Gap(20.sp),
        VText(
          "You're currently not holding any shares",
          style: context.text.title.copyWith(
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
        VText(
          "You have not yet acquired or purchased any\nshares in their account or portfolio.",
          style: context.text.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
    // return SliverFillRemaining(
    //   hasScrollBody: false,
    //   // child: emptyWidget,
    //   child: Column(
    //     children: List.generate(
    //       100,
    //       (index) {
    //         log("Build $index");
    //         return Container(
    //           child: Center(child: Text("Return")),
    //         );
    //       },
    //     ),
    //   ),
    // );
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        log("Build $index");
        return VListTile(
          onTap: () {},
          leading: Padding(
            padding: EdgeInsets.only(right: 8.0.sp),
            child: CircleAvatar(
              radius: 25.r,
              child: Image.network(
                networkImage,
              ),
            ),
          ),
          title: VText(
            "BBCA",
            style: context.text.title.copyWith(fontSize: 16.sp),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VText(
                Format.formatPortofolio(lot: 5, avgPrice: 8625),
                style: context.text.subtitle,
              ),
              VText(
                Format.formatDot(
                    separator: "-",
                    title: "Total",
                    value: "Rp " + "10000".currency),
                style: context.text.subtitle,
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VText(
                "6760".currency,
                style: context.text.title.copyWith(fontSize: 16.sp),
              ),
              VPriceChange(
                percentage: .5,
                price: 100,
                hasRp: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
