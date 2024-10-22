// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_portofolio_card.dart';

class _TradingBalanceWidget extends StatelessWidget {
  final double? tradingBalance;
  final bool loading;
  const _TradingBalanceWidget({
    Key? key,
    this.tradingBalance,
    this.loading = false,
  })  : assert(
          (tradingBalance != null && loading == false) ||
              (tradingBalance == null && loading),
          'Either child or label must be provided, but not both, and at least one must be non-null',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.sp,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VText(
                  "Trading Balance",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: context.color.grey,
                ),
                Gap(10.sp),
                Stack(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20.sp),
                    if (loading && tradingBalance == null)
                      VShimmer(height: 20.sp, width: 100.sp)
                    else
                      VText(
                        "Rp " + "$tradingBalance".currency,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
