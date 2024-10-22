part of 'my_stocks_tab.dart';

class MyStocksEmpty extends StatelessWidget {
  const MyStocksEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Gap(20.sp),
          BackgroundIconSvg(
            size: 120.sp,
            asset: Assets.icon.myStocksEmpty,
            padding: 15.sp,
          ),
          Gap(20.sp),
          Column(
            children: [
              VText(
                "Currently my stock is empty",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              Gap(4.sp),
              SizedBox(
                width: 0.7 * context.width,
                child: VText(
                  "You have no assets or stocks to trade or view at the moment.",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: context.color.grey,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
