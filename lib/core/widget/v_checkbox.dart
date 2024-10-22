// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChange;
  final EdgeInsets? padding;
  const VCheckbox({
    Key? key,
    required this.value,
    required this.onChange,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button.card(
      onTap: () => onChange(!value),
      padding: padding ?? 8.all,
      backgroundColor: Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      child: AnimatedContainer(
        duration: Durations.short3,
        width: 20.sp,
        height: 20.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: value ? context.color.primary : Colors.transparent,
          border: !value
              ? Border.all(
                  color: context.color.grey,
                )
              : Border.all(
                  color: context.color.primary,
                ),
        ),
        child: AnimatedSwitcher(
          duration: Durations.short3,
          child: value
              ? Assets.icon.check.svg(
                  height: 20.sp,
                  width: 20.sp,
                )
              : null,
        ),
      ),
    );
  }
}

class VDeleteButton extends StatelessWidget {
  final VoidCallback? onTap;
  const VDeleteButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button.card(
      onTap: onTap,
      padding: 8.all,
      backgroundColor: Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      child: AnimatedSwitcher(
        duration: Durations.short3,
        child: onTap != null
            ? Assets.icon.trash.svg(
                height: 24.sp,
                width: 24.sp,
                colorFilter: ColorFilter.mode(
                  context.color.textPrimary,
                  BlendMode.srcIn,
                ),
              )
            : Assets.icon.trash.svg(
                height: 24.sp,
                width: 24.sp,
                colorFilter: ColorFilter.mode(
                  context.color.grey,
                  BlendMode.srcIn,
                ),
              ),
      ),
    );
  }
}
