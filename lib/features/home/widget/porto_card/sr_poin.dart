// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_portofolio_card.dart';

class _SrPoinWidget extends StatelessWidget {
  final double? srPoin;
  final bool loading;
  const _SrPoinWidget({
    Key? key,
    this.srPoin,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 6.sp,
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
                Row(
                  children: [
                    Expanded(
                      child: VText(
                        "SR Poin",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: context.color.grey,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 18.sp,
                    )
                  ],
                ),
                Gap(10.sp),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.icon.srPoin.svg(width: 20.sp, height: 20.sp),
                    Gap(4.sp),
                    if (loading == true && srPoin == null)
                      VShimmer(height: 20.sp, width: 100.sp)
                    else
                      VText(
                        "$srPoin".currency,
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
