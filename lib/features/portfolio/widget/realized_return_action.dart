import 'package:sr_ui/core/core.dart';

class RealizedReturnAction extends StatelessWidget {
  const RealizedReturnAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
        vertical: 15.sp,
      ).copyWith(bottom: 0),
      color: context.color.backgroundCard,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VText(
                "This Week Return",
                textStyle: context.text.subtitle,
              ),
              VText(
                "Rp " + "${2000000}".currency,
                textStyle: context.text.price,
              ),
            ],
          ),
          Spacer(),
          Button.secondary(
            onTap: () {
              context.showBottomSheet(
                isScrollControlled: true,
                useRootNavigator: false,
                builder: (context) => RealizedReturnSheet(),
              );
            },
            padding: EdgeInsets.symmetric(
              vertical: 6.sp,
              horizontal: 15.sp,
            ),
            borderRadius: BorderRadius.circular(20),
            child: VRow(
              gap: Gap(6.sp),
              children: [
                VText(
                  "This Week",
                  textStyle: context.text.price.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AnimatedRotation(
                  duration: Duration(),
                  turns: 0.75,
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 12.sp,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
