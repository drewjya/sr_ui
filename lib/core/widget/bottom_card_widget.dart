import 'package:sr_ui/core/core.dart';

class BottomCardItem {
  final SvgGenImage asset;
  final String title;
  final String routeName;
  BottomCardItem({
    required this.asset,
    required this.title,
    required this.routeName,
  });
}

class BottomCardWidget extends StatelessWidget {
  final SvgGenImage asset;
  final String title;
  final VoidCallback? onTap;
  const BottomCardWidget({
    Key? key,
    required this.asset,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          color: context.color.card,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              asset.svg(
                height: 20.sp,
                width: 20.sp,
              ),
              Gap(5.sp),
              VText(
                title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
