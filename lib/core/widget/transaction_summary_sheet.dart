// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class TransactionSummarySheet extends HookConsumerWidget {
  final VoidCallback onAccept;
  const TransactionSummarySheet({
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
            asset: Assets.icon.transactionSummarySheet,
            size: 120.sp,
          ),
          Gap(20.sp),
          VText(
            "By disabling Transaction Summary, you will not receive the Transaction Summary pop up when making stock transactions. Are you sure you want to disable Transaction Summary?",
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
