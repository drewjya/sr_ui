import 'package:sr_ui/core/core.dart';

class TopUpCard extends StatelessWidget {
  const TopUpCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: context.color.card,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VText(
                  "Total Assets",
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
          ),
          context.divider,
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VText(
                  "Enter amount",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: context.color.grey,
                ),
                Gap(4.sp),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "",
                    prefixStyle: TextStyle(color: context.color.textPrimary),
                    prefixText: "Rp",
                    isDense: true,
                    // border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
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
