import 'package:sr_ui/core/core.dart';

extension BuildContextExt on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  Size get size => MediaQuery.sizeOf(this);
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  double get top => MediaQuery.paddingOf(this).top;
  double get left => MediaQuery.paddingOf(this).left;
  double get right => MediaQuery.paddingOf(this).right;
  double get bottom => MediaQuery.paddingOf(this).bottom;
  Widget get verticalDivider => VerticalDivider(
        width: 1.sp,
        color: color.divider,
        thickness: 1,
      );
  Widget get divider => Divider(
        height: 1.sp,
        thickness: 1,
        color: color.divider,
      );

  Future<T?> showBottomSheet<T>({
    required WidgetBuilder builder,
    bool useRootNavigator = true,
    bool isScrollControlled = true,
    BoxConstraints? constraints,
    bool isDismissible = true,
  }) async {
    return showModalBottomSheet<T>(
        context: this,
        isScrollControlled: isScrollControlled,
        constraints: constraints,
        isDismissible: isDismissible,
        enableDrag: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        useRootNavigator: useRootNavigator,
        builder: builder);
  }
}
