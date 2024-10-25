// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class LogoutSheet extends HookConsumerWidget {
  final VoidCallback onAccept;
  const LogoutSheet({
    Key? key,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Container(
      color: context.color.backgroundCard,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(15.sp),
          BackgroundIconSvg(
            padding: 20.sp,
            asset: Assets.icon.delete,
            size: 120.sp,
          ),
          Gap(30.sp),
          VText(
            "Are you absolutely certain you want\nto log out of your account?",
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
                    child: VText("YES"),
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
