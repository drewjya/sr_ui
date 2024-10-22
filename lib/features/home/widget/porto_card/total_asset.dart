// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_portofolio_card.dart';

class _TotalAssetWidget extends StatelessWidget {
  final double? totalAsset;

  final double? percentageChange;
  final double? priceChange;
  final bool loading;
  final double firstHeight;
  const _TotalAssetWidget({
    Key? key,
    this.totalAsset,
    this.percentageChange,
    this.priceChange,
    this.loading = false,
    required this.firstHeight,
  })  : assert(
          (loading &&
                  (totalAsset == null &&
                      percentageChange == null &&
                      priceChange == null)) ||
              (loading == false &&
                  (totalAsset != null &&
                      percentageChange != null &&
                      priceChange != null)),
          'Either child or label must be provided, but not both, and at least one must be non-null',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short4,
      height: firstHeight.sp,
      child: Center(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                VText(
                  "Total Aset",
                  fontSize: 14.sp,
                  color: context.color.grey,
                  fontWeight: FontWeight.w500,
                ),
                Gap(6.sp),
                if (loading && totalAsset == null)
                  VShimmer(
                    height: 18.sp,
                    width: 100.sp,
                  )
                else
                  VText(
                    "Rp" + "${totalAsset}".currency,
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                Gap(6.sp),
                if (loading && priceChange == null && percentageChange == null)
                  VPriceChange.loading(width: 80.sp)
                else
                  VPriceChange(
                    price: priceChange!,
                    percentage: percentageChange!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
