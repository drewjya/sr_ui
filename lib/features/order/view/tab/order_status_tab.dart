import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';

class OrderStatusTab extends StatelessWidget {
  const OrderStatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPinnedHeader(
          child: Padding(
            padding: 20.horizontal.copyWith(
                  top: 10.sp,
                  bottom: 10.sp,
                ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: 12.all,
                      isDense: true,
                      focusColor: Colors.white,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                Gap(8.sp),
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
                        style: context.text.price.copyWith(
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
          ),
        ),
        SliverClip(
          child: SliverList.builder(
            itemCount: 40,
            itemBuilder: (context, index) {
              return VListTile(
                backgroundColor: Colors.transparent,
                title: Text("Asjsj"),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Gap(60.sp),
        ),
      ],
    );
  }
}
