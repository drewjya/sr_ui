import 'package:sr_ui/core/core.dart';

class TNCVIew extends StatelessWidget {
  const TNCVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "TERMS AND CONDITIONS",
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
                vertical: 24.sp,
              ),
              child: VText(
                "Last Updated on 15/11/2024",
                style: context.text.title.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: 20.horizontal,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.sp,
                    horizontal: 15.sp,
                  ),
                  decoration: BoxDecoration(
                    color: context.color.cardBackground.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: context.color.cardBackground,
                    ),
                  ),
                  child: VColumn(
                    gap: Gap(10.sp),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VText(
                        "Acceptance of Terms",
                        style: context.text.subtitle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      VText(
                        "By creating an account and accessing the app, you confirm that you meet the legal age for stock trading in your country and agree to follow these Terms & Conditions, as well as any applicable local laws.",
                        style: context.text.subtitle.copyWith(
                          color: AppColor.cardGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Gap(10.sp),
            itemCount: 20,
          )
        ],
      ),
    );
  }
}
