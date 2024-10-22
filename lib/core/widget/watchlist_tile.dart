// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class WatchlistTile extends HookWidget {
  final String? image;
  final String stockCode;
  final String companyName;

  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Widget? trailing;

  const WatchlistTile({
    Key? key,
    this.image,
    required this.stockCode,
    required this.companyName,
    this.backgroundColor,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VListTile(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 20.sp,
      ).copyWith(right: 10.sp, top: 0),
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: VText(
        stockCode,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
      subtitle: VText(
        companyName,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: context.color.grey,
      ),
      trailing: trailing,
    );
  }
}
