// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class WithdrawSheet extends HookConsumerWidget {
  final VoidCallback onAccept;
  const WithdrawSheet({
    Key? key,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.color.backgroundCard,
      padding: 20.all,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(10.sp),
          BackgroundIconSvg(
            padding: 20.sp,
            asset: Assets.icon.withdrawSheet,
            size: 120.sp,
          ),
          Gap(20.sp),
          VText(
            "If you buy stocks again, you can make money! Last chance, are you sure you want to withdraw?",
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
            textAlign: TextAlign.center,
          ),
          Gap(20.sp),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ref.pop();
                  },
                  child: Center(
                    child: VText("CANCEL"),
                  ),
                ),
              ),
              Gap(10.sp),
              Expanded(
                child: ElevatedButton(
                  onPressed: onAccept,
                  child: Center(
                    child: VText("CONFIRM"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
