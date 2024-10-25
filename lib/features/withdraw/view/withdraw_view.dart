import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/topup/widget/bank_transfer_card.dart';

class WithdrawView extends ConsumerWidget {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBasic(
      titleText: "WITHDRAW",
      onBack: () => ref.pop(),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Gap(5.sp),
                Padding(
                  padding: 20.horizontal,
                  child: BankTransferCard(),
                ),
                Gap(15.sp),
                Container(
                  margin: 20.horizontal,
                  decoration: BoxDecoration(
                    color: context.color.backgroundCard,
                  ),
                  padding: 10.all,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VText(
                        "Enter Withdraw Amount",
                        style: context.text.subtitle,
                      ),
                      Gap(4.sp),
                      TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "",
                          prefixStyle:
                              TextStyle(color: context.color.textPrimary),
                          prefixText: "Rp",
                          isDense: true,
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(15.sp),
                Padding(
                  padding: 20.horizontal,
                  child: ElevatedButton(
                    onPressed: () {
                      context.showBottomSheet(
                        isScrollControlled: true,
                        useRootNavigator: false,
                        builder: (context) => WithdrawSheet(
                          onAccept: () {},
                        ),
                      );
                    },
                    child: Center(child: Text("CONTINUE")),
                  ),
                ),
                Gap(15.sp),
              ],
            ),
          ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: context.color.backgroundCard,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            sliver: SliverPadding(
              padding: 20.horizontal.copyWith(top: 15.sp, bottom: 6.sp),
              sliver: SliverToBoxAdapter(
                child: VText(
                  "RDN Balance Withdrawal Information",
                  style: context.text.title,
                ),
              ),
            ),
          ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: context.color.backgroundCard,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            sliver: SliverPadding(
              padding: 20.horizontal,
              sliver: SliverList.separated(
                itemCount: 10,
                separatorBuilder: (c, i) => Gap(6.sp),
                itemBuilder: (context, index) {
                  return ItemList(
                    top: 6.sp,
                    gap: 15.sp,
                    text:
                        "The minimum nominal for fund withdrawal is IDR 1,000",
                    size: (16 / sqrt(2)).sp,
                    style: context.text.subtitle.copyWith(
                      fontSize: 16.sp,
                      color: AppColor.hintTitle,
                    ),
                  );
                },
              ),
            ),
          ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: context.color.backgroundCard,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: SizedBox(
                height: 20.sp,
              ),
            ),
          ),
        ],
      ),
      // body: CustomScrollView(
      //   controller: scrollController,
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: 20.horizontal,
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: context.color.backgroundCard,
      //           ),
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   VText(
      //                     "Trading Balance",
      //                     fontSize: 14.sp,
      //                     fontWeight: FontWeight.w500,
      //                     color: context.color.grey,
      //                   ),
      //                   Gap(4.sp),
      //                   VText(
      //                     "Rp " + "${10000}".currency,
      //                     fontSize: 18.sp,
      //                     fontWeight: FontWeight.w600,
      //                     color: Colors.white,
      //                   ),
      //                 ],
      //               ),
      //               context.divider,
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
