// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class StockView extends HookConsumerWidget {
  final String stockCode;
  const StockView({
    required this.stockCode,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = useState(false);
    return ScaffoldBasic(
      title: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            child: Image.network(
              networkImage,
            ),
          ),
          Gap(8.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VText(
                  stockCode,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
                VText(
                  "Digital Mediatama",
                  textStyle: context.text.subtitle,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Button.card(
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            bookmark.value = !bookmark.value;
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
          child: AnimatedSwitcher(
            duration: Durations.medium1,
            child: bookmark.value
                ? Assets.icon.bookmark.svg()
                : Assets.icon.noBookmark.svg(),
          ),
        ),
      ],
      onBack: () => ref.pop(),
      body: Column(
        children: [],
      ),
    );
  }
}
