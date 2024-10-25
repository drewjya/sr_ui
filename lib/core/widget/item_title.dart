import 'package:sr_ui/core/core.dart';

class ItemTitle extends StatelessWidget {
  final String title;
  final double? totalValue;
  final Widget? value;
  final bool vertical;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets? padding;
  const ItemTitle({
    Key? key,
    required this.title,
    this.totalValue,
    this.value,
    this.vertical = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.padding,
  })  : assert(
            (value != null && totalValue == null) ||
                (value == null && totalValue != null),
            'Either titleText or title must be provided, but not both, and at least one must be non-null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: vertical
          ? Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
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
            )
          : Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
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
