// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget subtitle;
  final Widget? trailing;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const VListTile({
    Key? key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.backgroundColor,
    this.onTap,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        splashColor: AppColor.backgroundRipple,
        highlightColor: AppColor.backgroundRipple,
        child: Ink(
          color: backgroundColor ?? context.color.backgroundCard,
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: 10.sp,
                horizontal: 20.sp,
              ),
          child: Row(
            children: [
              if (leading != null) leading!,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title,
                    Gap(4.sp),
                    subtitle,
                  ],
                ),
              ),
              if (trailing != null) trailing!
            ],
          ),
        ),
      ),
    );
  }
}
