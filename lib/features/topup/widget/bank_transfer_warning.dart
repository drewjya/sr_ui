// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class BankTransferWarning extends StatelessWidget {
  const BankTransferWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.backgroundCard,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      padding: 15.all,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            VColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: Gap(15),
              children: [
                ItemList(
                  text:
                      "Top ups made outside of working hours (09.00 - 17.00) will be processed during business hours the next day.",
                ),
                ItemList(
                  text:
                      "Interbank transfers may be subject to fees, please check with the relevant bank/provider.",
                ),
              ],
            ),
            Gap(15.sp),
            Divider(
              height: 1.sp,
              thickness: 1.5,
              color: context.color.divider,
            ),
            Gap(20.sp),
            Stack(
              children: [
                Positioned(
                  bottom: 6.sp,
                  left: constraints.maxWidth * 0.1,
                  child: Assets.icon.arrowText.svg(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: VText(
                        "If any problem\narise",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "CLICK TO CONTINUE",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
