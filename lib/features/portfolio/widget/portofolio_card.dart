import 'package:sr_ui/core/core.dart';

class _ItemData extends StatelessWidget {
  final String title;
  final double? totalValue;
  final Widget? value;
  const _ItemData({
    Key? key,
    required this.title,
    this.totalValue,
    this.value,
  })  : assert(
            (value != null && totalValue == null) ||
                (value == null && totalValue != null),
            'Either titleText or title must be provided, but not both, and at least one must be non-null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VText(
            title,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: context.color.grey,
          ),
          Gap(10.sp),
          value ??
              VText(
                "Rp" + "${totalValue!}".currency,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              )
        ],
      ),
    );
  }
}

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.backgroundCard,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: VRow(
              gap: VerticalDivider(
                thickness: 1,
                width: 1,
                color: context.color.divider,
              ),
              children: [
                Expanded(
                  child: _ItemData(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
                Expanded(
                  child: _ItemData(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
              ],
            ),
          ),
          context.divider,
          IntrinsicHeight(
            child: VRow(
              gap: VerticalDivider(
                thickness: 1,
                width: 1,
                color: context.color.divider,
              ),
              children: [
                Expanded(
                  child: _ItemData(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
                Expanded(
                  child: _ItemData(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
