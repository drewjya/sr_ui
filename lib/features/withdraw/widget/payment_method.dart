import 'package:sr_ui/core/core.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VText(
          "Select Payment method",
          style: context.text.title,
        ),
        Gap(15.sp),
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Image.network(
                    networkImage,
                  ),
                ),
                Gap(8.sp),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VText(
                        "Bank Negara Indonesia",
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: context.color.textPrimary,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
