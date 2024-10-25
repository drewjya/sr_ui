import 'package:sr_ui/core/core.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.horizontal,
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: context.color.card,
        ),
        child: Column(
          children: [
            Padding(
              padding: 15.all,
              child: Row(
                children: [
                  CustomPaint(
                    painter: BorderGradientPainer(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.15),
                        ],
                        stops: [0.0, 0.4, 0.6, 1.0],
                      ),
                      borderRadius: 12,
                      strokeWidth: 2,
                    ),
                    child: Padding(
                      padding: 5.6.all,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.color.card.withBlue(221),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          networkImage,
                          height: 84.sp,
                          width: 84.sp,
                        ),
                      ),
                    ),
                  ),
                  Gap(18.sp),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              VText(
                                "Ratna Wilandari",
                                style: context.text.title
                                    .copyWith(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          Gap(8.sp),
                          VText(
                            "williamson@gmail.com",
                            style: context.text.title.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ItemTitle(
              title: "Trading Balance",
              totalValue: 6023939,
              vertical: false,
              padding: 0.all,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            Gap(15.sp),
            Consumer(
              builder: (context, ref, child) {
                final items = [
                  BottomCardItem(
                      asset: Assets.icon.topUp,
                      title: "Top Up",
                      routeName: Routes.topUpScreen),
                  BottomCardItem(
                    asset: Assets.icon.portofolio,
                    title: "Withdraw",
                    routeName: Routes.withdraw,
                  ),
                  BottomCardItem(
                    asset: Assets.icon.share,
                    title: "Mutation",
                    routeName: Routes.mutasi,
                  ),
                ];
                return SizedBox(
                  height: 48.sp,
                  child: VRow(
                    gap: context.verticalDivider,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: items.map(
                      (e) {
                        return Expanded(
                          child: BottomCardWidget(
                            asset: e.asset,
                            title: e.title,
                            onTap: () => ref.router.push(e.routeName),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
