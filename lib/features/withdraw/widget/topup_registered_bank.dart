import 'package:sr_ui/core/core.dart';

class TopUpRegisteredBank extends ConsumerWidget {
  const TopUpRegisteredBank();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VText(
          "Pay using registered bank account",
          textStyle: context.text.title,
          padding: 20.horizontal,
        ),
        Gap(7.5.sp),
        Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ref.router.push(Routes.bankTransfers);
                },
                child: Ink(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.5.sp,
                    horizontal: 20.sp,
                  ),
                  color: context.color.background,
                  child: Row(
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
                            Gap(4.sp),
                            VText(
                              "2982584",
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: context.color.grey,
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: context.color.textPrimary,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
