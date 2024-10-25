// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class DeleteSheet extends ConsumerWidget {
  final String message;
  final VoidCallback? onAccept;
  const DeleteSheet({
    Key? key,
    required this.message,
    this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          color: context.color.card,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        height: constraints.maxHeight,
        child: SingleChildScrollView(
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
                "$message",
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
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
        ),
      );
    });
  }
}
