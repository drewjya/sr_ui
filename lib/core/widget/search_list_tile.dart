// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class SearchListTile extends HookWidget {
  final String? image;
  final String stockCode;
  final String companyName;

  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SearchListTile({
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
    final bookmark = useState(false);
    return VListTile(
      
      leading: Padding(
        padding: EdgeInsets.only(right: 8.0.sp),
        child: CircleAvatar(
          radius: 25.r,
          child: Image.network(
            networkImage,
          ),
        ),
      ),
      onTap: onTap,
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 20.sp,
      ).copyWith(right: 10.sp),
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
      trailing: trailing ??
          Button.secondary(
            onTap: () {
              context.showBottomSheet(
                useRootNavigator: false,
                builder: (context) => DraggableScrollableSheet(
                  expand: false,
                  maxChildSize: 0.8,
                  initialChildSize: 0.4,
                  snap: true,
                  snapSizes: const [0.4, 0.6],
                  builder: (context, scrollController) {
                    return AddToWatchlistSheet(
                      controller: scrollController,
                    );
                  },
                ),
              );
            },
            borderRadius: BorderRadius.circular(100),
            child: AnimatedSwitcher(
              duration: Durations.medium1,
              child: bookmark.value
                  ? Assets.icon.bookmark.svg()
                  : Assets.icon.noBookmark.svg(),
            ),
          ),
    );
  }
}
