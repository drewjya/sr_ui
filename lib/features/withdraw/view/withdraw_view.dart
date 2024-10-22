import 'package:sr_ui/core/core.dart';

class WithdrawView extends HookConsumerWidget {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return ScaffoldBasic(
      titleText: "WITHDRAW",
      onBack: () => ref.pop(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: 20.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  color: context.color.backgroundCard,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        VText(
                          "Trading Balance",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: context.color.grey,
                        ),
                        Gap(4.sp),
                        VText(
                          "Rp " + "${10000}".currency,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    context.divider,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
